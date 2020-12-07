Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D52D0E86
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 11:59:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1BBE72E0D9;
	Mon,  7 Dec 2020 10:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arY88paVQ3-F; Mon,  7 Dec 2020 10:59:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7133D20421;
	Mon,  7 Dec 2020 10:59:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CFD0C013B;
	Mon,  7 Dec 2020 10:59:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACFA9C013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 10:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9A71486FB1
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 10:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJaeilaseo5y for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 10:59:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 048D486F90
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 10:59:08 +0000 (UTC)
Date: Mon, 7 Dec 2020 10:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607338747;
 bh=5X4Wa2tCGKFImboi89kNZo+q4agi1Sa5rC9nKY4bhJQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=jrzTGziG9p7kWufm4+jEWs1AcM3mYrffolvbVjt22y4jw6bR3+ct20YSRnbiynHtY
 ZKE4tl6T1gvC3TKkkMTo/b8kXbzkCoXXHxURN09nnRyqZFNrEPrEn83Z41+TK1Zqwk
 G/615OmtLz2u9VS2i5XQ0/7GIGsucMsjONeks3mxeOu1f+arJCjNu3kaZUeUFxelQr
 DNGxIeO6iSofrDL7Ns3ta0vdln1BnNkwvVlXYvmKDJTZ/qSrzCa6t+mACfEOgZYdQH
 frsrxtr2ZGwh5MPOQK6sc+0eE+hXtrY1f3UI29nQvj6YO4X00Zq/0NUDIJzW2ji1UD
 dX4ymbMZkAhKg==
From: Will Deacon <will@kernel.org>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH] iommu: Up front sanity check in the arm_lpae_map
Message-ID: <20201207105900.GB4198@willie-the-truck>
References: <20201205082957.12544-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205082957.12544-1-zhukeqian1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>,
 jiangkunkun@huawei.com, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, iommu@lists.linux-foundation.org,
 Mark Brown <broonie@kernel.org>, James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com,
 Thomas Gleixner <tglx@linutronix.de>, Robin Murphy <robin.murphy@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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

On Sat, Dec 05, 2020 at 04:29:57PM +0800, Keqian Zhu wrote:
> ... then we have more chance to detect wrong code logic.

This could do with being a bit more explicit. Something like:

	Although handling a mapping request with no permissions is a
	trivial no-op, defer the early return until after the size/range
	checks so that we are consistent with other mapping requests.

> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index a7a9bc08dcd1..8ade72adab31 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -444,10 +444,6 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>  	arm_lpae_iopte prot;
>  	long iaext = (s64)iova >> cfg->ias;
>  
> -	/* If no access, then nothing to do */
> -	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
> -		return 0;
> -
>  	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
>  		return -EINVAL;
>  
> @@ -456,6 +452,10 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>  	if (WARN_ON(iaext || paddr >> cfg->oas))
>  		return -ERANGE;
>  
> +	/* If no access, then nothing to do */
> +	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
> +		return 0;

This looks sensible to me, but please can you make the same change for
io-pgtable-arm-v7s.c so that the behaviour is consistent across the two
formats?

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
