Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B8489BDB
	for <lists.iommu@lfdr.de>; Mon, 10 Jan 2022 16:09:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA86A408D9;
	Mon, 10 Jan 2022 15:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQ4Nvg9M7yAK; Mon, 10 Jan 2022 15:09:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C987D40908;
	Mon, 10 Jan 2022 15:09:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AE42C006E;
	Mon, 10 Jan 2022 15:09:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D50CC001E
 for <iommu@lists.linux-foundation.org>; Mon, 10 Jan 2022 15:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24667403AC
 for <iommu@lists.linux-foundation.org>; Mon, 10 Jan 2022 15:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99JHTvTjbEK3 for <iommu@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 15:09:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 483C4400B9
 for <iommu@lists.linux-foundation.org>; Mon, 10 Jan 2022 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641827388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqCR8DvhBxiCC4TzGlm/t/7v2g7znFq4gFV1cmWoEXc=;
 b=CXuvenrwHx7YFnqzXVsm1zs5IrujfFoKwnLPZtCn290rjpP6Vt/ZtRYhUbotBED2yHgloL
 m3PjQH6kI3jiNUoqb6z+kikNcxXJ5bV0+lzWdeZkknqhuFpW5Zzl51KPXgFxQ3t1tYm5ZX
 /gWcLVBsSmwfx69WJXqj/vzD+AbY7WE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-NpxM4G_9NV6vWHjkZx2eng-1; Mon, 10 Jan 2022 10:09:46 -0500
X-MC-Unique: NpxM4G_9NV6vWHjkZx2eng-1
Received: by mail-wm1-f72.google.com with SMTP id
 m15-20020a7bce0f000000b003473d477618so6525553wmc.8
 for <iommu@lists.linux-foundation.org>; Mon, 10 Jan 2022 07:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pqCR8DvhBxiCC4TzGlm/t/7v2g7znFq4gFV1cmWoEXc=;
 b=PH+YYaypdtfn6QWhKsAX94Haf0XM2Rdy6/wsHLteQywZV5Nt5VwskjmzCRibyLTBuP
 pUFpYwPMqm2gt3JbjBA6+nRGecrH6gqVEZQx9j7Lskdr1SQqao4h5oheBlZytjmV5ov5
 ZfKP3jMl4lr9CY7bLe6TvKFtw0ZOikRwTRltLv7CzM2cZjNo1Ee2pE5tZD4CqgIjhjHz
 fxLDwXCcyci0S55cm6REJWGICr8AWxKiHD50TqWAs/Slj9x86alwFmgE5oqTVzc8JqIy
 nFy6u/cHepGWMOK8MkTety083D9r6n27YVhdwxgaJ2l7PXrJry6ugkd7hMcxl4C4Knaj
 ZLRA==
X-Gm-Message-State: AOAM531UhUeFimRPvYXwH7A43CpS0mQN4SF1M5tY8048/6880IVPHD5M
 pbpddrdqmzQgvINaMYEAqtN+nkU3o6WwN239ngIPEUvokAxqI1+JU2PJo1WprwytT3/23x8ArIV
 wwWmDtzzcheZ7aTMETjT0rnp1KMOu/g==
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr92694wrd.234.1641827384692; 
 Mon, 10 Jan 2022 07:09:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+Wi7ut3xNdrf+rI6tR7FUH1Wzlso2Na/Gkg81RELF3PPjhams/SaDbGDnPVE94lb71Siqrw==
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr92655wrd.234.1641827384391; 
 Mon, 10 Jan 2022 07:09:44 -0800 (PST)
Received: from redhat.com ([2.55.148.228])
 by smtp.gmail.com with ESMTPSA id m6sm7888102wrx.36.2022.01.10.07.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 07:09:43 -0800 (PST)
Date: Mon, 10 Jan 2022 10:09:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH v12 00/13] Introduce VDUSE - vDPA Device in Userspace
Message-ID: <20220110100911-mutt-send-email-mst@kernel.org>
References: <20210830141737.181-1-xieyongji@bytedance.com>
 <20220110075546-mutt-send-email-mst@kernel.org>
 <CACycT3v1aEViw7vV4x5qeGVPrSrO-BTDvQshEX35rx_X0Au2vw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACycT3v1aEViw7vV4x5qeGVPrSrO-BTDvQshEX35rx_X0Au2vw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm <kvm@vger.kernel.org>, Jason Wang <jasowang@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Liu Xiaodong <xiaodong.liu@intel.com>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Stefan Hajnoczi <stefanha@redhat.com>,
 songmuchun@bytedance.com, Jens Axboe <axboe@kernel.dk>,
 He Zhe <zhe.he@windriver.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, Netdev <netdev@vger.kernel.org>, Joe Perches <joe@perches.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mika.penttila@nextfour.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, Jan 10, 2022 at 09:54:08PM +0800, Yongji Xie wrote:
> On Mon, Jan 10, 2022 at 8:57 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Aug 30, 2021 at 10:17:24PM +0800, Xie Yongji wrote:
> > > This series introduces a framework that makes it possible to implement
> > > software-emulated vDPA devices in userspace. And to make the device
> > > emulation more secure, the emulated vDPA device's control path is handled
> > > in the kernel and only the data path is implemented in the userspace.
> > >
> > > Since the emuldated vDPA device's control path is handled in the kernel,
> > > a message mechnism is introduced to make userspace be aware of the data
> > > path related changes. Userspace can use read()/write() to receive/reply
> > > the control messages.
> > >
> > > In the data path, the core is mapping dma buffer into VDUSE daemon's
> > > address space, which can be implemented in different ways depending on
> > > the vdpa bus to which the vDPA device is attached.
> > >
> > > In virtio-vdpa case, we implements a MMU-based software IOTLB with
> > > bounce-buffering mechanism to achieve that. And in vhost-vdpa case, the dma
> > > buffer is reside in a userspace memory region which can be shared to the
> > > VDUSE userspace processs via transferring the shmfd.
> > >
> > > The details and our user case is shown below:
> > >
> > > ------------------------    -------------------------   ----------------------------------------------
> > > |            Container |    |              QEMU(VM) |   |                               VDUSE daemon |
> > > |       ---------      |    |  -------------------  |   | ------------------------- ---------------- |
> > > |       |dev/vdx|      |    |  |/dev/vhost-vdpa-x|  |   | | vDPA device emulation | | block driver | |
> > > ------------+-----------     -----------+------------   -------------+----------------------+---------
> > >             |                           |                            |                      |
> > >             |                           |                            |                      |
> > > ------------+---------------------------+----------------------------+----------------------+---------
> > > |    | block device |           |  vhost device |            | vduse driver |          | TCP/IP |    |
> > > |    -------+--------           --------+--------            -------+--------          -----+----    |
> > > |           |                           |                           |                       |        |
> > > | ----------+----------       ----------+-----------         -------+-------                |        |
> > > | | virtio-blk driver |       |  vhost-vdpa driver |         | vdpa device |                |        |
> > > | ----------+----------       ----------+-----------         -------+-------                |        |
> > > |           |      virtio bus           |                           |                       |        |
> > > |   --------+----+-----------           |                           |                       |        |
> > > |                |                      |                           |                       |        |
> > > |      ----------+----------            |                           |                       |        |
> > > |      | virtio-blk device |            |                           |                       |        |
> > > |      ----------+----------            |                           |                       |        |
> > > |                |                      |                           |                       |        |
> > > |     -----------+-----------           |                           |                       |        |
> > > |     |  virtio-vdpa driver |           |                           |                       |        |
> > > |     -----------+-----------           |                           |                       |        |
> > > |                |                      |                           |    vdpa bus           |        |
> > > |     -----------+----------------------+---------------------------+------------           |        |
> > > |                                                                                        ---+---     |
> > > -----------------------------------------------------------------------------------------| NIC |------
> > >                                                                                          ---+---
> > >                                                                                             |
> > >                                                                                    ---------+---------
> > >                                                                                    | Remote Storages |
> > >                                                                                    -------------------
> > >
> > > We make use of it to implement a block device connecting to
> > > our distributed storage, which can be used both in containers and
> > > VMs. Thus, we can have an unified technology stack in this two cases.
> > >
> > > To test it with null-blk:
> > >
> > >   $ qemu-storage-daemon \
> > >       --chardev socket,id=charmonitor,path=/tmp/qmp.sock,server,nowait \
> > >       --monitor chardev=charmonitor \
> > >       --blockdev driver=host_device,cache.direct=on,aio=native,filename=/dev/nullb0,node-name=disk0 \
> > >       --export type=vduse-blk,id=test,node-name=disk0,writable=on,name=vduse-null,num-queues=16,queue-size=128
> > >
> > > The qemu-storage-daemon can be found at https://github.com/bytedance/qemu/tree/vduse
> >
> > It's been half a year - any plans to upstream this?
> 
> Yeah, this is on my to-do list this month.
> 
> Sorry for taking so long... I've been working on another project
> enabling userspace RDMA with VDUSE for the past few months. So I
> didn't have much time for this. Anyway, I will submit the first
> version as soon as possible.
> 
> Thanks,
> Yongji

Oh fun. You mean like virtio-rdma? Or RDMA as a backend for regular
virtio?

-- 
MST

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
