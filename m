Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC1F389EAB
	for <lists.iommu@lfdr.de>; Thu, 20 May 2021 09:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6428983C73;
	Thu, 20 May 2021 07:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LM7w81igS0UI; Thu, 20 May 2021 07:08:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68D8C83C59;
	Thu, 20 May 2021 07:08:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B480C0001;
	Thu, 20 May 2021 07:08:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E9EEC0001
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 07:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB56A606C8
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 07:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMpBoB4eq6Yo for <iommu@lists.linux-foundation.org>;
 Thu, 20 May 2021 07:08:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19E62605BB
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 07:08:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id lz27so23549583ejb.11
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 00:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KPPDvbdoZYkF98kJEXLJL5DQM+/NDzpAbyD+0wj0y0A=;
 b=Se9KYEfzncKvZO5zuibSZNbij3GfLYq8vJWZIp5Rt7L9U5AyliRF9b0kqfP6IAmgge
 7Krig9HpLukT74foF5zhNSAlQwK2yDEcBbVOWe5ziBdJ8l8A4E0m1P87IPiYFuaIY6UE
 k79Xf3InR5zOQmjg8jMvS37YGVQm94PGO0lIcvXbhWGWr30k+pNFNRDadGZk8bu2lu9+
 tTLWF0hTnA816jLyuweb3DM1RTEi+87p0Qe9+TImwfmI+OmewWBM/i8IMHK5U7pWkFGC
 AbjI3ivFGlXwBO+7i1ZCHXmWnoxS9VFDTqlUmnwJ0M5G8JFKs2Hx0HMa19GMvyknHXal
 Q+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KPPDvbdoZYkF98kJEXLJL5DQM+/NDzpAbyD+0wj0y0A=;
 b=KiKgTpGeqVjgjYSG6jjn8udDmW5AweM8OJW1N3tU62lwKy9ONWiw2ZzBcei3/ykAq0
 o5jbtvVG6cYbjL87Chfj1ih7B5dKkEA2cFFfIjk3qObN80SZrn111SDmnGYAbHfUSTuE
 BrnNbjYu4t8CNXy12b8+eIOpmYdN0A0zWFspgdXK2+ZzFDuWebEnHBGOv48SWqo91sOK
 78zVGYHnkRFx7KxgWc2EVL2TBqc+eBYeJw97KyLc4JRKLSwiXLsR7y8BYDSqJZ8erBzE
 C3bKE8nVRlMqMe2J4NWfO4+34sDTf3YvgR1dcuw1/Vln691ULyU/MQRO0jXx1lVW8UI3
 hzbA==
X-Gm-Message-State: AOAM533KvX/DByWT14VCMFmYK/2tkQChWsyKdD6WAnawc3EYeFwBaAn3
 k0l7ILiEbgOXEsVbrvNOQefH6jBYogugnEshEcAG
X-Google-Smtp-Source: ABdhPJw1qaVXgdxcGdVjGAKmjj/w5JqA2hGu9Vaio3k3hOBCyVJZ7/UOZ9K52sSkcUhiotF7loRy9jJ04HYXeZSSc/k=
X-Received: by 2002:a17:906:456:: with SMTP id
 e22mr3125837eja.427.1621494521280; 
 Thu, 20 May 2021 00:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210517095513.850-1-xieyongji@bytedance.com>
 <20210517095513.850-5-xieyongji@bytedance.com>
 <CACycT3s1rEvNnNkJKQsHGRsyLPADieFdVkb1Sp3GObR0Vox5Fg@mail.gmail.com>
 <20210519144206.GF32682@kadam>
 <CACycT3veubBFCg9omxLDJJFP7B7QH8++Q+tKmb_M_hmNS45cmw@mail.gmail.com>
 <20210520013921-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210520013921-mutt-send-email-mst@kernel.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 20 May 2021 15:08:30 +0800
Message-ID: <CACycT3v=JDH4SE=2GyeTJVZ7iywhpJoKCYhZ0tAvZTxgfSoOWQ@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v7 04/12] virtio-blk: Add validation for block
 size in config space
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel <linux-kernel@vger.kernel.org>,
 kvm <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@nextfour.com>,
 netdev@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>, iommu@lists.linux-foundation.org,
 Matthew Wilcox <willy@infradead.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <christian.brauner@canonical.com>, bcrl@kvack.org,
 Al Viro <viro@zeniv.linux.org.uk>, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>
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

On Thu, May 20, 2021 at 1:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, May 20, 2021 at 01:25:16PM +0800, Yongji Xie wrote:
> > On Wed, May 19, 2021 at 10:42 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Wed, May 19, 2021 at 09:39:20PM +0800, Yongji Xie wrote:
> > > > On Mon, May 17, 2021 at 5:56 PM Xie Yongji <xieyongji@bytedance.com> wrote:
> > > > >
> > > > > This ensures that we will not use an invalid block size
> > > > > in config space (might come from an untrusted device).
> > >
> > > I looked at if I should add this as an untrusted function so that Smatch
> > > could find these sorts of bugs but this is reading data from the host so
> > > there has to be some level of trust...
> > >
> >
> > It would be great if Smatch could detect this case if possible. The
> > data might be trusted in traditional VM cases. But now the data can be
> > read from a userspace daemon when VDUSE is enabled.
> >
> > > I should add some more untrusted data kvm functions to Smatch.  Right
> > > now I only have kvm_register_read() and I've added kvm_read_guest_virt()
> > > just now.
> > >
> > > > >
> > > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > > ---
> > > > >  drivers/block/virtio_blk.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > > > index ebb4d3fe803f..c848aa36d49b 100644
> > > > > --- a/drivers/block/virtio_blk.c
> > > > > +++ b/drivers/block/virtio_blk.c
> > > > > @@ -826,7 +826,7 @@ static int virtblk_probe(struct virtio_device *vdev)
> > > > >         err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
> > > > >                                    struct virtio_blk_config, blk_size,
> > > > >                                    &blk_size);
> > > > > -       if (!err)
> > > > > +       if (!err && blk_size > 0 && blk_size <= max_size)
> > > >
> > > > The check here is incorrect. I will use PAGE_SIZE as the maximum
> > > > boundary in the new version.
> > >
> > > What does this bug look like to the user?
> >
> > The kernel will panic if the block size is larger than PAGE_SIZE.
>
> Kernel panic at this point is par for the course IMHO.

But it seems better if we can avoid this kind of panic. Because this
might also be triggered by a buggy VDUSE daemon.

> Let's focus on eliminating data corruption for starters.

OK, now the incorrect used length might cause data corruption in
virtio-net and virtio-console drivers as I mentioned in another mail.
I will send a fix ASAP.

Thanks,
Yongji
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
