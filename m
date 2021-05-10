Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6E37932A
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 17:55:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3043340652;
	Mon, 10 May 2021 15:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w98NQIZkiNTl; Mon, 10 May 2021 15:54:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02EEB40371;
	Mon, 10 May 2021 15:54:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D88B5C0001;
	Mon, 10 May 2021 15:54:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 277BAC0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08FDA8377F
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ziepe.ca
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tHbbkq612AVx for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 15:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2069983709
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:54:56 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id h1so8564943qvv.10
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 08:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dKnE93StZsqCunlDWqAom0kQB6W55N5BaGWqotQGVUE=;
 b=nuCBcs9/S1aTLECuWcN5h85qoqBaLLtCmy8zbuhR+zPZIMDw77L3oRAU7xMeuDuh42
 1aY3lX4gkaR/KbePkX7G1aB4Tpotsrq6rAP9gAhtcsTRhc0Gr01HHPgz83z/GnxJGBsg
 Bgm+850D+Iu3fWcIhJnyleMndHaJU8eu5R+J7ww9ibnhcQrnYmdXCBCA/riNKAbRtSll
 l1yAaUuiGbs9mNbvE3XsoU7M2UC1x/oM1anr+WkEwv0XXzudrTewGREVjZScvyVEfQdQ
 cELamVl6RymHsUL1VXH8Yvje4DNltTqqC+G2U/5otju6aAnXdj/94+nc1C46u8eQdS8I
 heCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dKnE93StZsqCunlDWqAom0kQB6W55N5BaGWqotQGVUE=;
 b=H5CqK6a3lfeAXlVB0gHAZGv1+3QBxNka0/YKSiXM2ycNTorMxPeB94NxlSBfwb+oPt
 DlVelVNlEtUHLIkvl9M8/k/qKZxZ2scXJ3QT/MgFdFp2QSOuGcAvzCmNRmqMH+T/q6AY
 SOqKoCYYQYfOvA1KfzGQUtZf7Hzq6STeB3uATyFJOdiKQKzDFPTU03JaeXWCZlMTMoYK
 NU4bFEkDOfTMHpfkuUnHw3uh+wN69RbS0V/V4+XufVpvBVZwxm8q76IVNI0l3b+owxwL
 0dlHfXBhwDGUyZ6Bc/c0H91yLq0hm/KlHf7ZAye7CN6pCy20BVDp+RAvbd3vtlLpLr0Y
 wNwg==
X-Gm-Message-State: AOAM533hrMeiC2Eh3k+0WfYx6SwTlbIYVj7LjgaswZ5I8OsvJGmiX4hd
 3Z8Y7VROFTLdChcZBTpjecSo1A==
X-Google-Smtp-Source: ABdhPJxmEWE6l8G4ddQYCJA3Ydglf+qOUGmIWRC1Z06kUQgptb6+ijWYRVzLErmdhwjQdbwCc1sh8A==
X-Received: by 2002:a0c:bd8c:: with SMTP id n12mr2852029qvg.29.1620662095910; 
 Mon, 10 May 2021 08:54:55 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id g185sm11814969qkf.62.2021.05.10.08.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:54:55 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lg8FC-004bOW-Vr; Mon, 10 May 2021 12:54:55 -0300
Date: Mon, 10 May 2021 12:54:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] vfio: remove the unused mdev iommu hook
Message-ID: <20210510155454.GA1096940@ziepe.ca>
References: <20210510065405.2334771-1-hch@lst.de>
 <20210510065405.2334771-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510065405.2334771-4-hch@lst.de>
Cc: kvm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, May 10, 2021 at 08:54:02AM +0200, Christoph Hellwig wrote:
> The iommu_device field in struct mdev_device has never been used
> since it was added more than 2 years ago.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 132 ++++++--------------------------
>  include/linux/mdev.h            |  20 -----
>  2 files changed, 25 insertions(+), 127 deletions(-)

I asked Intel folks to deal with this a month ago:

https://lore.kernel.org/kvm/20210406200030.GA425310@nvidia.com/

So lets just remove it, it is clearly a bad idea

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
