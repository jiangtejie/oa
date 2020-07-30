package org.joa.swft.manager.netty;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.codec.http.websocketx.extensions.compression.WebSocketServerCompressionHandler;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import lombok.extern.slf4j.Slf4j;

/**
 * @author jtj
 */
@Slf4j
public class NettyServer {

    private int port;

    public NettyServer(int port) {
        this.port = port;
    }

    public void start() {
        //bossLoopGroup 表示服务器连接监听线程组，专门接受 accept 新的客户端client 连接
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        //workerGroup 表示处理每一条连接的数据收发的线程组
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        ServerBootstrap b = new ServerBootstrap();
        b.group(bossGroup, workerGroup)
                //NIO模式
                .channel(NioServerSocketChannel.class)
                .handler(new LoggingHandler(LogLevel.INFO))
                //指定化自定义客户端初始化器
                .childHandler(new ChannelInitializer<SocketChannel>() {

                    private static final String WEBSOCKET_PATH = "/";

                    @Override
                    protected void initChannel(SocketChannel socketChannel) throws Exception {
                        log.warn("Start Netty ......");
                        //ch.pipeline().addLast()就是添加一个逻辑处理器。
                        socketChannel.pipeline().addLast(new ServerHandler()); //处理tcp协议传输的数据
                        socketChannel.pipeline().addLast(new HttpServerCodec()); // http 编码
                        socketChannel.pipeline().addLast(new HttpObjectAggregator(65536)); // http 消息聚合器
                        socketChannel.pipeline().addLast(new WebSocketServerCompressionHandler()); // 压缩 可以不设置
                        socketChannel.pipeline().addLast(new WebSocketServerProtocolHandler(WEBSOCKET_PATH, null, true)); // 协议
                        socketChannel.pipeline().addLast(new WebSocketFrameHandler()); // 处理WebSocketFrame
                    }
                })
                .option(ChannelOption.SO_BACKLOG, 128)
                // 两小时内没有数据的通信时,TCP会自动发送一个活动探测数据报文
                .childOption(ChannelOption.SO_KEEPALIVE, true);
        ChannelFuture f = null;
        try {
            f = b.bind(port).sync();
            f.channel().closeFuture().sync();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            workerGroup.shutdownGracefully();
            bossGroup.shutdownGracefully();
        }
    }
}
