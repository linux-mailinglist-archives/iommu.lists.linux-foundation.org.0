Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AAE18A444
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 21:53:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 096F62107A;
	Wed, 18 Mar 2020 20:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrGkInUNoHJ9; Wed, 18 Mar 2020 20:53:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5FF6C204FB;
	Wed, 18 Mar 2020 20:53:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 524EEC013E;
	Wed, 18 Mar 2020 20:53:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C8B6C013E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A4DA20522
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBR7iQzQbcH6 for <iommu@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:53:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0262F204FB
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:53:19 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A52320724;
 Wed, 18 Mar 2020 20:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584564798;
 bh=8wAN/f1aMP2liMU401snv1i6GPM2bYC2hDL+sl2agsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eTDk4BlZ2XmtdjWrBoz5sahaOascBFFiphCoWC8j7ksnhWCEVTCP2hbk/EYF57Kcc
 CTOfTy23kC+5WDb66kARHCqAmUNhlpKCH/AMujD+LsCN1CWzKSEU3h2sTMdSRJECKI
 QPl/051JYZkT1y7cFKQLrY8nExshFesWdXWJp8XY=
Date: Wed, 18 Mar 2020 20:53:14 +0000
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: arm-smmu-v3 high cpu usage for NVMe
Message-ID: <20200318205313.GB8094@willie-the-truck>
References: <20190821151749.23743-1-will@kernel.org>
 <b2a6e26d-6d0d-7f0d-f222-589812f701d2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2a6e26d-6d0d-7f0d-f222-589812f701d2@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Ming Lei <ming.lei@redhat.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

Hi John,

On Thu, Jan 02, 2020 at 05:44:39PM +0000, John Garry wrote:
> And for the overall system, we have:
> 
>   PerfTop:   85864 irqs/sec  kernel:89.6%  exact:  0.0% lost: 0/34434 drop:
> 0/40116 [4000Hz cycles],  (all, 96 CPUs)
> --------------------------------------------------------------------------------------------------------------------------
> 
>     27.43%  [kernel]          [k] arm_smmu_cmdq_issue_cmdlist
>     11.71%  [kernel]          [k] _raw_spin_unlock_irqrestore
>      6.35%  [kernel]          [k] _raw_spin_unlock_irq
>      2.65%  [kernel]          [k] get_user_pages_fast
>      2.03%  [kernel]          [k] __slab_free
>      1.55%  [kernel]          [k] tick_nohz_idle_exit
>      1.47%  [kernel]          [k] arm_lpae_map
>      1.39%  [kernel]          [k] __fget
>      1.14%  [kernel]          [k] __lock_text_start
>      1.09%  [kernel]          [k] _raw_spin_lock
>      1.08%  [kernel]          [k] bio_release_pages.part.42
>      1.03%  [kernel]          [k] __sbitmap_get_word
>      0.97%  [kernel]          [k] arm_smmu_atc_inv_domain.constprop.42
>      0.91%  [kernel]          [k] fput_many
>      0.88%  [kernel]          [k] __arm_lpae_map
> 
> One thing to note is that we still spend an appreciable amount of time in
> arm_smmu_atc_inv_domain(), which is disappointing when considering it should
> effectively be a noop.
> 
> As for arm_smmu_cmdq_issue_cmdlist(), I do note that during the testing our
> batch size is 1, so we're not seeing the real benefit of the batching. I
> can't help but think that we could improve this code to try to combine CMD
> SYNCs for small batches.
> 
> Anyway, let me know your thoughts or any questions. I'll have a look if a
> get a chance for other possible bottlenecks.

Did you ever get any more information on this? I don't have any SMMUv3
hardware any more, so I can't really dig into this myself.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
