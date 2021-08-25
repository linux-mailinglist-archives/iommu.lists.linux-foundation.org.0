Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 851473F6EDE
	for <lists.iommu@lfdr.de>; Wed, 25 Aug 2021 07:37:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA4CB8103B;
	Wed, 25 Aug 2021 05:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxIY-EtdQiFj; Wed, 25 Aug 2021 05:37:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B166781029;
	Wed, 25 Aug 2021 05:37:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7517AC0022;
	Wed, 25 Aug 2021 05:37:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8364C000E
 for <iommu@lists.linux-foundation.org>; Wed, 25 Aug 2021 05:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A93C040277
 for <iommu@lists.linux-foundation.org>; Wed, 25 Aug 2021 05:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7xJ2DkDL3Rr for <iommu@lists.linux-foundation.org>;
 Wed, 25 Aug 2021 05:37:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47F57401D8
 for <iommu@lists.linux-foundation.org>; Wed, 25 Aug 2021 05:37:22 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s25so22457618edw.0
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 22:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3yeuD/AKt6duI6f+LLwvmXj5/7qzqoMz+rmo5sVDYrk=;
 b=Vp7EsjbsKk4CbMZuzoUYLzrpydiTBr1zHF+HyG9J/wtoW8bsVHI746U+1hvWAKn7pY
 S2KGD1hdXhYpvRVmdQ6WR1fQxGII47CoeOMGBaYQ/Mi4TolUM5hV7u25ftgsXF0RWGh/
 oyRF1xadCZb6aP6wOK20F7wxGFstAZ7BuyRbsRE+aDrQ7ch+4LllkUaJdROcaj8x+KAj
 ZOy85WB4jyz34slTJHHU6QuKku6j+KC19AfzueBsMNFAdKQmlECIKMC6wJ+DZ7prxUj4
 ddL12p3dIBF+Z7rYjgciVlV8upMbYsRSCOxkj2pFlsJcMFqU9/31/TAQO6ln7+ZPJcon
 AYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3yeuD/AKt6duI6f+LLwvmXj5/7qzqoMz+rmo5sVDYrk=;
 b=nX0bXZN8QnmVSgmjTJhSpnCCLIuPKUO++7LBoU+oPj9CJfSYhwmGsxlrslp2Mi2e2x
 F+jpSE1NuJc3WjZUJP62JJQgBiIJMDcTn8J8bpz8skdqktVUbJ1rSEslAo7H0n31A9w2
 Xku+BNBAPMjTPP7VUH7HFOVFqi3B/IUQEARKfZnCxXE7RZoA60iXz73f83kzH4IFVZUb
 w+BApOw+JIQHIaOaDQSi9aDi6HeCk1jYuufiVoBAIvWyy7KP3Tu0WrdkLPSqI/u0FAfJ
 KR91VLBLAMqUCEQbDB4OZTAVOPkYlUn1gvy2IbWg1eW2oCLhaocmQF+PbGWOoXnsRzjU
 jolA==
X-Gm-Message-State: AOAM533Vh08WlBM6Rf/to74AeMCdqOYOY8uP12BEZ339+cqiglApC2Qm
 Qhn6uLFkqPlMU2FIJKQPs07xMlnTNwU6+qc1IEuJ
X-Google-Smtp-Source: ABdhPJyZTxYAJpwJ1zytuFP4isC6BozsaW7fwdKwUj6HuqFf6QhFlF2KyJtLZvCBCv/uMpGPvMvKn/tLFmS1aI89w14=
X-Received: by 2002:a50:fd86:: with SMTP id o6mr6104183edt.312.1629869841320; 
 Tue, 24 Aug 2021 22:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210818120642.165-1-xieyongji@bytedance.com>
 <20210818120642.165-12-xieyongji@bytedance.com>
 <20210824140945-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210824140945-mutt-send-email-mst@kernel.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 25 Aug 2021 13:37:10 +0800
Message-ID: <CACycT3s0Pp+LOD2h_vocPUMEqMhYioJmRPFYGL=Su-eL2p2O3w@mail.gmail.com>
Subject: Re: [PATCH v11 11/12] vduse: Introduce VDUSE - vDPA Device in
 Userspace
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm <kvm@vger.kernel.org>, Jason Wang <jasowang@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Liu Xiaodong <xiaodong.liu@intel.com>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Stefan Hajnoczi <stefanha@redhat.com>,
 songmuchun@bytedance.com, Jens Axboe <axboe@kernel.dk>,
 He Zhe <zhe.he@windriver.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@nextfour.com>
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

On Wed, Aug 25, 2021 at 2:10 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Aug 18, 2021 at 08:06:41PM +0800, Xie Yongji wrote:
> > This VDUSE driver enables implementing software-emulated vDPA
> > devices in userspace. The vDPA device is created by
> > ioctl(VDUSE_CREATE_DEV) on /dev/vduse/control. Then a char device
> > interface (/dev/vduse/$NAME) is exported to userspace for device
> > emulation.
> >
> > In order to make the device emulation more secure, the device's
> > control path is handled in kernel. A message mechnism is introduced
> > to forward some dataplane related control messages to userspace.
> >
> > And in the data path, the DMA buffer will be mapped into userspace
> > address space through different ways depending on the vDPA bus to
> > which the vDPA device is attached. In virtio-vdpa case, the MMU-based
> > software IOTLB is used to achieve that. And in vhost-vdpa case, the
> > DMA buffer is reside in a userspace memory region which can be shared
> > to the VDUSE userspace processs via transferring the shmfd.
> >
> > For more details on VDUSE design and usage, please see the follow-on
> > Documentation commit.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
>
> Build bot seems unhappy with this patch.
>

Yes, this is because the series relies on the unmerged patch:

https://lore.kernel.org/lkml/20210705071910.31965-1-jasowang@redhat.com/

Do I need to remove this dependency in the next version?

Thanks,
Yongji
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
