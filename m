Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 654534C6BF2
	for <lists.iommu@lfdr.de>; Mon, 28 Feb 2022 13:16:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1229A81ABB;
	Mon, 28 Feb 2022 12:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eAzRUJoEt_N; Mon, 28 Feb 2022 12:16:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2505C81ABA;
	Mon, 28 Feb 2022 12:16:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E94AEC007B;
	Mon, 28 Feb 2022 12:16:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E980C001A
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 12:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BB6960B3A
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 12:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLRceVSEt78b for <iommu@lists.linux-foundation.org>;
 Mon, 28 Feb 2022 12:16:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FFB160ACD
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 12:16:49 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B927A4B0; Mon, 28 Feb 2022 13:16:45 +0100 (CET)
Date: Mon, 28 Feb 2022 13:16:43 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] iommu/tegra-smmu: Fix missing put_device() call in
 tegra_smmu_find
Message-ID: <Yhy9K07YCIyeIeJ/@8bytes.org>
References: <20220107080915.12686-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107080915.12686-1-linmq006@gmail.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Will Deacon <will@kernel.org>
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

On Fri, Jan 07, 2022 at 08:09:11AM +0000, Miaoqian Lin wrote:
> The reference taken by 'of_find_device_by_node()' must be released when
> not needed anymore.
> Add the corresponding 'put_device()' in the error handling path.
> 
> Fixes: 765a9d1d02b2 ("iommu/tegra-smmu: Fix mc errors on tegra124-nyan")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied for v5.17, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
