Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC9A3498B8
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 18:54:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 027AE83E68;
	Thu, 25 Mar 2021 17:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW3DKbdROhSK; Thu, 25 Mar 2021 17:54:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3487A83C65;
	Thu, 25 Mar 2021 17:54:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20C9EC000A;
	Thu, 25 Mar 2021 17:54:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39ECCC000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2723184A41
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWCAHKwxuzAi for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 17:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7987847EF
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:53:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 005376192E;
 Thu, 25 Mar 2021 17:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616694839;
 bh=p9Fw2VLMXBm9WgC0jrRce9sCideLVwWWxngLieDXLLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ggTDTbr92KwP/mo+C2q0J3WFddw0H+IKJWQBbaFFSjZ5oY8Dmu4wHRa9QVpWJLR2M
 O3/vjS5TtRUHfnaRhuhH/rNtOQTOO2a2fJIzlzll1Y5bQ5WFqn1+hqZKhytwGgCoCO
 TNj7hpKX3eWJHHdHVJDt6rUNRefcyfO8Cti2AkVjjcdUqTt1NWAtxMoBMCloPgTEpo
 vzkR5v1+RT5byZy9E8NSsabT0RHHcbeKAzNgxrRERVo7GSEt5GxYjDpuN5k6vnGkg2
 I+luU5xrMQsGQiAvflIQDX0P5uf5qLkgkPJw/RrXiCRCGzyFk9yZgbzmMXf9fEqWQf
 5SFPdUDzKptyg==
Date: Thu, 25 Mar 2021 17:53:54 +0000
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2 0/4] iommu/iova: Add CPU hotplug handler to flush
 rcaches to core code
Message-ID: <20210325175354.GE15504@willie-the-truck>
References: <1616675401-151997-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616675401-151997-1-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

On Thu, Mar 25, 2021 at 08:29:57PM +0800, John Garry wrote:
> The Intel IOMMU driver supports flushing the per-CPU rcaches when a CPU is
> offlined.
> 
> Let's move it to core code, so everyone can take advantage.
> 
> Also throw in a patch to stop exporting free_iova_fast().
> 
> Differences to v1:
> - Add RB tags (thanks!)
> - Add patch to stop exporting free_iova_fast()
> - Drop patch to correct comment
> - Add patch to delete iommu_dma_free_cpu_cached_iovas() and associated
>   changes
> 
> John Garry (4):
>   iova: Add CPU hotplug handler to flush rcaches
>   iommu/vt-d: Remove IOVA domain rcache flushing for CPU offlining
>   iommu: Delete iommu_dma_free_cpu_cached_iovas()
>   iommu: Stop exporting free_iova_fast()

Looks like this is all set for 5.13, so hopefully Joerg can stick it in
-next for a bit more exposure.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
