Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C51191C118F
	for <lists.iommu@lfdr.de>; Fri,  1 May 2020 13:37:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9FF5F2604C;
	Fri,  1 May 2020 11:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PB8EZu2kDGYY; Fri,  1 May 2020 11:37:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AD41F25D1F;
	Fri,  1 May 2020 11:37:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 948D6C016F;
	Fri,  1 May 2020 11:37:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83B79C016F
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6CA12878EC
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBhEhfzL2DMr for <iommu@lists.linux-foundation.org>;
 Fri,  1 May 2020 11:37:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2D987878E7
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:37:49 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 08B613A4; Fri,  1 May 2020 13:37:46 +0200 (CEST)
Date: Fri, 1 May 2020 13:37:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH v2]iommu/qcom:fix local_base status check
Message-ID: <20200501113745.GE18423@8bytes.org>
References: <20200418134703.1760-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200418134703.1760-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
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

On Sat, Apr 18, 2020 at 09:47:03PM +0800, Tang Bin wrote:
> The function qcom_iommu_device_probe() does not perform sufficient
> error checking after executing devm_ioremap_resource(), which can
> result in crashes if a critical error path is encountered.
> 
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
> v2:
>  - fix commit message and add fixed tag
> ---
>  drivers/iommu/qcom_iommu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied for v5.7, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
