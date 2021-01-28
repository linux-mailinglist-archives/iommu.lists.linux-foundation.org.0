Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF76307098
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 09:05:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF30C86C10;
	Thu, 28 Jan 2021 08:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84uwOs8yx5E1; Thu, 28 Jan 2021 08:04:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9355D86C0F;
	Thu, 28 Jan 2021 08:04:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71CA0C013A;
	Thu, 28 Jan 2021 08:04:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E992C013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 08:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B8758734E
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 08:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xX8T-xubeDqD for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 08:04:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BEB6081C5B
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 08:04:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16D4B64DDA;
 Thu, 28 Jan 2021 08:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611821094;
 bh=GuLi/8pmF+rCgjPXwttqZpfpUDWjxcO0+aBtX7a6cpk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PJNlFazuzogyHS95uUijQnggfofbJSHp4E1kJjQrb9wi7AOPHtoRGgcFljLsNPOsI
 dAiKEea5u8NcfJs6yeXLXdg4+We5/Nt6h5G8s9pjXEpsTUNn2Mz9zTaovvLzmjt7EE
 JfRf+akhzadrBzz//k88tU5HlhLlEJyPUsxYYbZI=
Date: Thu, 28 Jan 2021 09:04:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianxiong Gao <jxgao@google.com>
Subject: Re: [PATCH 0/3] Adding offset keeping option when mapping data via
 SWIOTLB.*
Message-ID: <YBJwImu3RoQsGhJq@kroah.com>
References: <20210128003829.1892018-1-jxgao@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128003829.1892018-1-jxgao@google.com>
Cc: axboe@fb.com, heikki.krogerus@linux.intel.com, sagi@grimberg.me,
 saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, kbusch@kernel.org, bgolaszewski@baylibre.com,
 iommu@lists.linux-foundation.org, jroedel@suse.de, dan.j.williams@intel.com,
 andriy.shevchenko@linux.intel.com, robin.murphy@arm.com, hch@lst.de
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

On Wed, Jan 27, 2021 at 04:38:26PM -0800, Jianxiong Gao wrote:
> NVMe driver and other applications may depend on the data offset
> to operate correctly. Currently when unaligned data is mapped via
> SWIOTLB, the data is mapped as slab aligned with the SWIOTLB. This
> patch adds an option to make sure the mapped data preserves its
> offset of the orginal addrss.
> 
> Without the patch when creating xfs formatted disk on NVMe backends,
> with swiotlb=force in kernel boot option, creates the following error:
> meta-data=/dev/nvme2n1           isize=512    agcount=4, agsize=131072 blks
>          =                       sectsz=512   attr=2, projid32bit=1
>          =                       crc=1        finobt=1, sparse=0, rmapbt=0, refl
> ink=0
> data     =                       bsize=4096   blocks=524288, imaxpct=25
>          =                       sunit=0      swidth=0 blks
> naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
> log      =internal log           bsize=4096   blocks=2560, version=2
>          =                       sectsz=512   sunit=0 blks, lazy-count=1
> realtime =none                   extsz=4096   blocks=0, rtextents=0
> mkfs.xfs: pwrite failed: Input/output error
> 
> Jianxiong Gao (3):
>   Adding page_offset_mask to device_dma_parameters
>   Add swiotlb offset preserving mapping when
>     dma_dma_parameters->page_offset_mask is non zero.
>   Adding device_dma_parameters->offset_preserve_mask to NVMe driver.


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
