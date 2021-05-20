Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A057F389D16
	for <lists.iommu@lfdr.de>; Thu, 20 May 2021 07:25:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 250D6606C8;
	Thu, 20 May 2021 05:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kubZqrhXe66E; Thu, 20 May 2021 05:25:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47FCC60625;
	Thu, 20 May 2021 05:25:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27948C0001;
	Thu, 20 May 2021 05:25:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3E86C0001
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 05:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE6B183BF7
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 05:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdqBLnDolytK for <iommu@lists.linux-foundation.org>;
 Thu, 20 May 2021 05:25:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FDFB82E69
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 05:25:29 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l1so23258034ejb.6
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 22:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uWBM5AU+ZMmhfuFgx+3Y6a4UcjGbnQI1cx3aK/uVkZc=;
 b=GL+WlKsfyUHY8seOawsA4s5AlWavihDlxxMiz4lqDQkGQ3TCLutMAu4lMNn1Jxl1jd
 y6HZQBYQq4ioIg5e1Lo1gqt31jawj5s1SHuxpLit2ITf+CLm+kWietUyVpKk9w4fmD2p
 H1mq2ZWQ+t44wxCCc60m/5A3JNEqMh/2fd2x9LhB3LxkVed1yMz8Mpz7F/P0y2G397sv
 VSQF7iSQ5NJLrAtBZr6BqKr6Rz+PbkPQ/INLOdyfBiVRt3/wYV7gh1O0NplzDAANxyj3
 lbLjDfxqrMTZkAS3Dv9Xk96J7MuslFrqt1MYHRbQds+nk19xlmKW/1bKi0HXgU5HEy19
 xy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWBM5AU+ZMmhfuFgx+3Y6a4UcjGbnQI1cx3aK/uVkZc=;
 b=eo6YY8U38DM4AYMog1ve8v6tWeD3SsfP+9wenzRLMkNyWpQc/8OI2mWMZ1LB6FzEIt
 6e8F/RpGUck5AU1WMGCAmaA0Li2D1ds8dC/a79xjdS0JnL6Gsxusi6aC0KRSevGMqjoZ
 orUgVYKF8ZLb3WgtF4mox9TGj934GY6HrtZFsxMGW02E+Va+6+ELv2+FPAnWaokMA1rp
 PnbpIyOgNyaZe+wi5qK/mghHoYY7w43uFWpF/o3sgNZSJk9//D8xfSDIbNcuEmrRc9ty
 uNvnDhjYoMOD+KJOz85NPJSYcfglUH+ODBuj3UcFaQA5kBl3BA4+oTkMuj33dwPj9YXy
 H/bg==
X-Gm-Message-State: AOAM5315+jesV7Gl+yg14s04xtwIVFESvr+yKuGcWLAfuXSll2lCcbA6
 twyoCd/9ilc4GBBPchWU8mgs71rR1eW8Dr/yOpKr
X-Google-Smtp-Source: ABdhPJyvwWWA7f5Fzvsx4TdTu7nIvH6pnRUuPJ62OuR0bCAchfYi7vwKGliv4oVBF/L7UoIrnWNYnk0fkzFFBOuZgj8=
X-Received: by 2002:a17:906:edaf:: with SMTP id
 sa15mr2877318ejb.174.1621488327265; 
 Wed, 19 May 2021 22:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210517095513.850-1-xieyongji@bytedance.com>
 <20210517095513.850-5-xieyongji@bytedance.com>
 <CACycT3s1rEvNnNkJKQsHGRsyLPADieFdVkb1Sp3GObR0Vox5Fg@mail.gmail.com>
 <20210519144206.GF32682@kadam>
In-Reply-To: <20210519144206.GF32682@kadam>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 20 May 2021 13:25:16 +0800
Message-ID: <CACycT3veubBFCg9omxLDJJFP7B7QH8++Q+tKmb_M_hmNS45cmw@mail.gmail.com>
Subject: Re: Re: [PATCH v7 04/12] virtio-blk: Add validation for block size in
 config space
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 iommu@lists.linux-foundation.org, Matthew Wilcox <willy@infradead.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <christian.brauner@canonical.com>, bcrl@kvack.org,
 Parav Pandit <parav@nvidia.com>, viro@zeniv.linux.org.uk,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@nextfour.com>,
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

On Wed, May 19, 2021 at 10:42 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, May 19, 2021 at 09:39:20PM +0800, Yongji Xie wrote:
> > On Mon, May 17, 2021 at 5:56 PM Xie Yongji <xieyongji@bytedance.com> wrote:
> > >
> > > This ensures that we will not use an invalid block size
> > > in config space (might come from an untrusted device).
>
> I looked at if I should add this as an untrusted function so that Smatch
> could find these sorts of bugs but this is reading data from the host so
> there has to be some level of trust...
>

It would be great if Smatch could detect this case if possible. The
data might be trusted in traditional VM cases. But now the data can be
read from a userspace daemon when VDUSE is enabled.

> I should add some more untrusted data kvm functions to Smatch.  Right
> now I only have kvm_register_read() and I've added kvm_read_guest_virt()
> just now.
>
> > >
> > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > ---
> > >  drivers/block/virtio_blk.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > index ebb4d3fe803f..c848aa36d49b 100644
> > > --- a/drivers/block/virtio_blk.c
> > > +++ b/drivers/block/virtio_blk.c
> > > @@ -826,7 +826,7 @@ static int virtblk_probe(struct virtio_device *vdev)
> > >         err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
> > >                                    struct virtio_blk_config, blk_size,
> > >                                    &blk_size);
> > > -       if (!err)
> > > +       if (!err && blk_size > 0 && blk_size <= max_size)
> >
> > The check here is incorrect. I will use PAGE_SIZE as the maximum
> > boundary in the new version.
>
> What does this bug look like to the user?

The kernel will panic if the block size is larger than PAGE_SIZE.

> A minimum block size of 1 seems pretty crazy.  Surely the minimum should be > higher?
>

Yes, 512 is better here.

Thanks,
Yongji
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
