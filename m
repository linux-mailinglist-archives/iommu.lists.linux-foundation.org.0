Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6912A9AFE
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 18:39:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7E9508753E;
	Fri,  6 Nov 2020 17:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3IEojWENetM; Fri,  6 Nov 2020 17:39:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EEAB38704C;
	Fri,  6 Nov 2020 17:39:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6D5FC0889;
	Fri,  6 Nov 2020 17:39:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A4DBC0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 179FA870B1
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uydqXtkn--ln for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 17:39:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5B1348704C
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:39:35 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v11so932655qtq.12
 for <iommu@lists.linux-foundation.org>; Fri, 06 Nov 2020 09:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QqZ++Pt3MZPl0c26h7esX3kKVTLpDd4DLyuldQOeJ6E=;
 b=aVspDJwpvtyG5+kighP26kbunhoVoDrk2g+dikuA78Pm3bA2qTEMgmEOIf1kZJzMIf
 jREWUhSOExSA/q/FCxqA4XBVE24zI+bsJoB1MfEIxBjq2vdyDXVafteyCmFKOVp6mNFr
 a+tx6++MRi2ULgDc9l1aIYs8bYmkHkHdREfE1OJi7rMzsOZFvHKvzXQ7XJqg4Rv2jtLq
 /+Dlp7JoggqKZn8R6W1cCZQ0admWy+NkyCMZtOTh144o5mkYSgGm7bfVWOa4R1qrCUIm
 0U96w1WKj0KdQqF8ogG0DBvSehQPHSPP+p8q7o2QpQF4H1UThgaq/hW1ayZpgvaa/xXc
 nKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QqZ++Pt3MZPl0c26h7esX3kKVTLpDd4DLyuldQOeJ6E=;
 b=iUqSYNDKps83IJDfNZNSUST5ca9427553p+urMwKNmF35gcBKT0ndP5+tu+T9C+O8z
 izWhBmwU/RhwchU9wwauknrTyYUEQn2eAsja7brEPyfkHDQ7WXAszlYjXpfgE1cerXPu
 cA27chCMO5nDYjx5eCtjPy2vBvD/lPBBsnEL0il7okLPh0JTAKshFNjsITrmuTlKhDaX
 q2U7I8uqTYoAGcTrKjLGQ2XcjdCsuZdxIBKJluamG/pzXr5oUF0B1mKCQ5+0hyY+2kKN
 rIxPjuP3aTogZ3kBcGin9Ei4ARxo9AvQ2Gav52ria968LkZN5xDU/BcYl5+E9tjNk1Gq
 bh1g==
X-Gm-Message-State: AOAM531xyoeIhURQcojELVc/lnWZ0niRkEDst7+C3CBUogZUjZOWYXem
 7iPHQheX3638vPt4Tq8qTuH9ag==
X-Google-Smtp-Source: ABdhPJwk/LVr/ux401xFB0f8tEBQvqxB/lNHOmPBnGlIZGn/taGrIczG0r9kVyPbYEVYIeCjEKrF7Q==
X-Received: by 2002:ac8:1e84:: with SMTP id c4mr2651870qtm.340.1604684374450; 
 Fri, 06 Nov 2020 09:39:34 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id o19sm1032238qko.3.2020.11.06.09.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 09:39:33 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kb5i0-000zRk-Qy; Fri, 06 Nov 2020 13:39:32 -0400
Date: Fri, 6 Nov 2020 13:39:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [RFC PATCH 15/15] nvme-pci: Allow mmaping the CMB in userspace
Message-ID: <20201106173932.GT36674@ziepe.ca>
References: <20201106170036.18713-1-logang@deltatee.com>
 <20201106170036.18713-16-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106170036.18713-16-logang@deltatee.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-pci@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ira Weiny <iweiny@intel.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Matthew Wilcox <willy@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Christoph Hellwig <hch@lst.de>
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

On Fri, Nov 06, 2020 at 10:00:36AM -0700, Logan Gunthorpe wrote:
> Allow userspace to obtain CMB memory by mmaping the controller's
> char device. The mmap call allocates and returns a hunk of CMB memory,
> (the offset is ignored) so userspace does not have control over the
> address within the CMB.
> 
> A VMA allocated in this way will only be usable by drivers that set
> FOLL_PCI_P2PDMA when calling GUP. And inter-device support will be
> checked the first time the pages are mapped for DMA.
> 
> Currently this is only supported by O_DIRECT to an PCI NVMe device
> or through the NVMe passthrough IOCTL.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>  drivers/nvme/host/core.c | 11 +++++++++++
>  drivers/nvme/host/nvme.h |  1 +
>  drivers/nvme/host/pci.c  |  9 +++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index f14316c9b34a..fc642aba671d 100644
> +++ b/drivers/nvme/host/core.c
> @@ -3240,12 +3240,23 @@ static long nvme_dev_ioctl(struct file *file, unsigned int cmd,
>  	}
>  }
>  
> +static int nvme_dev_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct nvme_ctrl *ctrl = file->private_data;
> +
> +	if (!ctrl->ops->mmap_cmb)
> +		return -ENODEV;
> +
> +	return ctrl->ops->mmap_cmb(ctrl, vma);
> +}

This needs to ensure that the VMA created is destroyed before the
driver is unprobed - ie the struct pages backing the BAR memory is
destroyed.

I don't see anything that synchronizes this in the nvme_dev_release()?

Many places do this by putting all the VMAs into an address space and
zaping the address space when unprobing the driver to revoke the
pages, but there is a tricky race here :\

https://lore.kernel.org/dri-devel/20201021125030.GK36674@ziepe.ca/

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
