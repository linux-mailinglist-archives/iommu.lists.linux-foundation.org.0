Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518B2B8C92
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 08:54:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD0498738F;
	Thu, 19 Nov 2020 07:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNXAxWLyAZZI; Thu, 19 Nov 2020 07:54:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 233A987383;
	Thu, 19 Nov 2020 07:54:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 159D6C0891;
	Thu, 19 Nov 2020 07:54:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 976FCC0891
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 07:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9380585C08
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 07:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYIAcV8jhELt for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 07:54:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0B808859CF
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 07:54:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5338667373; Thu, 19 Nov 2020 08:54:23 +0100 (CET)
Date: Thu, 19 Nov 2020 08:54:22 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [PATCH v5] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
Message-ID: <20201119075422.GA15840@lst.de>
References: <20201118201243.18510-1-Ashish.Kalra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118201243.18510-1-Ashish.Kalra@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Thomas.Lendacky@amd.com, jon.grimm@amd.com, brijesh.singh@amd.com,
 dave.hansen@linux-intel.com, konrad.wilk@oracle.com, peterz@infradead.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 mingo@redhat.com, bp@alien8.de, luto@kernel.org, hpa@zytor.com,
 rientjes@google.com, tglx@linutronix.de, hch@lst.de
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

On Wed, Nov 18, 2020 at 08:12:43PM +0000, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> For SEV, all DMA to and from guest has to use shared
> (un-encrypted) pages. SEV uses SWIOTLB to make this
> happen without requiring changes to device drivers.
> However, depending on workload being run, the default
> 64MB of SWIOTLB might not be enough and SWIOTLB
> may run out of buffers to use for DMA, resulting
> in I/O errors and/or performance degradation for
> high I/O workloads.

FYI, you can use up 73 chars for your commit log.  This looks rather
compressed.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
