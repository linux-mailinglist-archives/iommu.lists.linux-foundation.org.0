Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DA35A17F5E5
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 12:15:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67723886C4;
	Tue, 10 Mar 2020 11:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfOFSHHxDlKJ; Tue, 10 Mar 2020 11:15:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71027886B5;
	Tue, 10 Mar 2020 11:15:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52EDFC1D8E;
	Tue, 10 Mar 2020 11:15:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4D2FC0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 11:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D164C88353
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 11:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLF7I5k5k1oG for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:15:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5D55A88344
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 11:15:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8344F364; Tue, 10 Mar 2020 12:15:04 +0100 (CET)
Date: Tue, 10 Mar 2020 12:15:03 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/6] Replace private domain with per-group default
Message-ID: <20200310111503.GF3794@8bytes.org>
References: <20200307062014.3288-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307062014.3288-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Derrick Jonathan <jonathan.derrick@intel.com>
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

Hi Baolu,

On Sat, Mar 07, 2020 at 02:20:08PM +0800, Lu Baolu wrote:
> Lu Baolu (5):
>   iommu: Configure default domain with dev_def_domain_type
>   iommu/vt-d: Don't force 32bit devices to uses DMA domain
>   iommu/vt-d: Don't force PCI sub-hierarchy to use DMA domain
>   iommu/vt-d: Add dev_def_domain_type callback
>   iommu/vt-d: Apply per-device dma_ops
> 
> Sai Praneeth Prakhya (1):
>   iommu: Add dev_def_domain_type() callback in iommu_ops

I like this patch-set, but I fear some regressions from patch
"iommu/vt-d: Don't force 32bit devices to uses DMA domain". Have you
tested this series on a couple of machines, ideally even older ones from
the first generation of VT-d hardware?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
