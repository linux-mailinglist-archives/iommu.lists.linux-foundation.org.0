Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D0730ABE0
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 16:50:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3EB8E2048B;
	Mon,  1 Feb 2021 15:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZTAaurnONUM; Mon,  1 Feb 2021 15:50:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 603D320496;
	Mon,  1 Feb 2021 15:50:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BA11C013A;
	Mon,  1 Feb 2021 15:50:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 748D5C013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 15:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3CBDE2047F
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 15:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gH74FTQtuJRZ for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 15:50:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id BEB582048C
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 15:50:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A91A464DE1;
 Mon,  1 Feb 2021 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612194626;
 bh=LPWd8gDhHLYrCTwScMmESUyKBXeoErabGVfpRcQJr+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/FlsACD4oNtPFVRFroArwrcZsqrjWj44oS3N5mE1F7BdrVdQnBCjSNm2Oa+s8k6r
 2WDU8laRguhCNh5YydQb6iyWj1cse4ICOgIjDJ58M+NSYAuA0mxbMzYDG6Q1iYo39P
 C5YepY1LzPeUNLz9+ooUGgO7Eq/MhEfESftRaxYgck8GzsTaE22n/HJxa8I9O3I/nu
 58Jx2bUa1UWE81F1LiKhPzsX096hCd9UF+Nh4K3HrIIgDFU1e8hQd2+q0F92KkCq+5
 saxOHhCgU1glFPBjXFGO4seBSpeDUdl3N8wdbdj8z6lH6QAo+yAKy6JUBJs58pTycY
 25G+SpNrAjjtg==
Date: Mon, 1 Feb 2021 15:50:21 +0000
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v5 0/1] perf/smmuv3: Don't reserve the PMCG register spaces
Message-ID: <20210201155021.GD15263@willie-the-truck>
References: <20210201132750.1709-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201132750.1709-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, Feb 01, 2021 at 09:27:49PM +0800, Zhen Lei wrote:
> v4 --> v5:
> 1. Give up doing the mapping for the entire SMMU register space.
> 2. Fix some compile warnings. Sorry. So sorry.

That's alright, these things happen. However, this came in slightly too
late for 5.12, so please resend at -rc1 and we'll aim for 5.13.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
