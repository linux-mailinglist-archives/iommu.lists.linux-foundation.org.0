Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BD389D34
	for <lists.iommu@lfdr.de>; Thu, 20 May 2021 07:43:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC74C6060B;
	Thu, 20 May 2021 05:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UalieXUE381b; Thu, 20 May 2021 05:43:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D652F60716;
	Thu, 20 May 2021 05:43:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF092C0001;
	Thu, 20 May 2021 05:43:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11D81C0001
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 05:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00C0E40187
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 05:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ut7mcUEs96J for <iommu@lists.linux-foundation.org>;
 Thu, 20 May 2021 05:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44F0540182
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621489413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GjW4Njna3bnKmMjSqk9By1QrG7BREpE+oMFazMCyiuc=;
 b=RRL8DDhaYPVgtloo0xdB9F+BwAiHuFpShr+4nTgLXyodQoMbecFPVCmHErHlgY8lGBpoFw
 lQ9X9zZGlghDbTj+k0q7TaoY+Z+A1PqdOhBsd8BCcXvRmTp6DBG7EIMICc8EbVTvEa5D9y
 RZb/Ra/NsF+RicdPJ23beF6Mlg0MuAQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-3M9GJFWXOFOHAgaX2uswzw-1; Thu, 20 May 2021 01:43:31 -0400
X-MC-Unique: 3M9GJFWXOFOHAgaX2uswzw-1
Received: by mail-wr1-f69.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso8191449wre.8
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 22:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GjW4Njna3bnKmMjSqk9By1QrG7BREpE+oMFazMCyiuc=;
 b=Wf46tYjgyTdQJDaB9bnJ7vgktnBgUS7Lkjl7xS7sd26+hKUKrvr3ippPYPFQqPGkl9
 oGJqQGTWu5orweeAMugTs6yZG3nkxIRc7ZdGhDpwzLAxkI1VL22fPQFubH9PvXCt/PUS
 eu5Y/UXSUpGGphYoNJeAtw4Jy7VQ1P6ZlXJxCn8dhKYkRWNps6+QJjF1Y9sm/33gR99D
 A9cQh7rxvNRWkXaFz2kI2fYwlNaTJoXAIqZCTvqD2ePzTQ9KCjrF/blEn0g/Pf/nLmjx
 kzDLFCq2eVd3w9Vi6UFfg2XhyKFzPsR/1YhIAg87xWA2aG7dhW8mc1zubNKHvE0uy+Z+
 y5wA==
X-Gm-Message-State: AOAM531K0qcU/thiIB1LGVLzu99KT9b+jG71jGwp14smD7SRiSMjCECh
 Sh6P228sMQzjFbFJsKjBVpDaz/u8O7HVFwGdioIh9+Zj8XUXX5e3AT1UeSIH1Qch0minizZQLvT
 qtPLLmx8jiO/9JGnvcCvtCHQ8fBiSwg==
X-Received: by 2002:a5d:524b:: with SMTP id k11mr2308307wrc.292.1621489410042; 
 Wed, 19 May 2021 22:43:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPmuJaJcBIzoz51cJHFKBEGSMwRicV/EJnxc2pubykB7VVTdZU5S/RsC7BPoTegDy8gNdFLQ==
X-Received: by 2002:a5d:524b:: with SMTP id k11mr2308281wrc.292.1621489409886; 
 Wed, 19 May 2021 22:43:29 -0700 (PDT)
Received: from redhat.com (bzq-79-181-160-222.red.bezeqint.net.
 [79.181.160.222])
 by smtp.gmail.com with ESMTPSA id t16sm1717230wrb.66.2021.05.19.22.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 22:43:29 -0700 (PDT)
Date: Thu, 20 May 2021 01:43:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: Re: [PATCH v7 04/12] virtio-blk: Add validation for block size
 in config space
Message-ID: <20210520013921-mutt-send-email-mst@kernel.org>
References: <20210517095513.850-1-xieyongji@bytedance.com>
 <20210517095513.850-5-xieyongji@bytedance.com>
 <CACycT3s1rEvNnNkJKQsHGRsyLPADieFdVkb1Sp3GObR0Vox5Fg@mail.gmail.com>
 <20210519144206.GF32682@kadam>
 <CACycT3veubBFCg9omxLDJJFP7B7QH8++Q+tKmb_M_hmNS45cmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACycT3veubBFCg9omxLDJJFP7B7QH8++Q+tKmb_M_hmNS45cmw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel <linux-kernel@vger.kernel.org>,
 kvm <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mika.penttila@nextfour.com>,
 netdev@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>, iommu@lists.linux-foundation.org,
 Matthew Wilcox <willy@infradead.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <christian.brauner@canonical.com>, bcrl@kvack.org,
 Parav Pandit <parav@nvidia.com>, viro@zeniv.linux.org.uk,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
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

On Thu, May 20, 2021 at 01:25:16PM +0800, Yongji Xie wrote:
> On Wed, May 19, 2021 at 10:42 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Wed, May 19, 2021 at 09:39:20PM +0800, Yongji Xie wrote:
> > > On Mon, May 17, 2021 at 5:56 PM Xie Yongji <xieyongji@bytedance.com> wrote:
> > > >
> > > > This ensures that we will not use an invalid block size
> > > > in config space (might come from an untrusted device).
> >
> > I looked at if I should add this as an untrusted function so that Smatch
> > could find these sorts of bugs but this is reading data from the host so
> > there has to be some level of trust...
> >
> 
> It would be great if Smatch could detect this case if possible. The
> data might be trusted in traditional VM cases. But now the data can be
> read from a userspace daemon when VDUSE is enabled.
> 
> > I should add some more untrusted data kvm functions to Smatch.  Right
> > now I only have kvm_register_read() and I've added kvm_read_guest_virt()
> > just now.
> >
> > > >
> > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > ---
> > > >  drivers/block/virtio_blk.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > > index ebb4d3fe803f..c848aa36d49b 100644
> > > > --- a/drivers/block/virtio_blk.c
> > > > +++ b/drivers/block/virtio_blk.c
> > > > @@ -826,7 +826,7 @@ static int virtblk_probe(struct virtio_device *vdev)
> > > >         err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
> > > >                                    struct virtio_blk_config, blk_size,
> > > >                                    &blk_size);
> > > > -       if (!err)
> > > > +       if (!err && blk_size > 0 && blk_size <= max_size)
> > >
> > > The check here is incorrect. I will use PAGE_SIZE as the maximum
> > > boundary in the new version.
> >
> > What does this bug look like to the user?
> 
> The kernel will panic if the block size is larger than PAGE_SIZE.

Kernel panic at this point is par for the course IMHO.
Let's focus on eliminating data corruption for starters.

> > A minimum block size of 1 seems pretty crazy.  Surely the minimum should be > higher?
> >
> 
> Yes, 512 is better here.
> 
> Thanks,
> Yongji

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
