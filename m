Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A7E265B90
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 10:27:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 95F7A20778;
	Fri, 11 Sep 2020 08:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eM1nYhcBgZS; Fri, 11 Sep 2020 08:27:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9A2C42083F;
	Fri, 11 Sep 2020 08:27:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AE24C0859;
	Fri, 11 Sep 2020 08:27:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C3AEC0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 629982050F
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1f5hflahvw3W for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 08:27:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-21.smtp-out.us-west-2.amazonses.com
 (a27-21.smtp-out.us-west-2.amazonses.com [54.240.27.21])
 by silver.osuosl.org (Postfix) with ESMTPS id CB49420488
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812836;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=ZdtW6rpgsglIfBJcVsz/0AjRMgDcxq4B9Pi3Nq/Gau0=;
 b=E6Rk3AIxEKUtzaVAThW+7UkMdszIIdaKJjXNxHYbWlHeZPsSv38/3bZDftAqhfyJ
 Cu5n2ziFqjWTlFrXruPP5nh60lrX8lT5Cy74caFjLE/lv0RVX7qHAvLJ6XfNViHzLd7
 UMThrkdmXd95rpO17GLixgt1mE8yUGNVoQJ7hFYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812836;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=ZdtW6rpgsglIfBJcVsz/0AjRMgDcxq4B9Pi3Nq/Gau0=;
 b=HUN56W8Hkc/TGjYeGayhHSK6/oborX82J5Zogs7eeuKZKbVlwV/s+96eYAsN9m+o
 sEITUrlkNFuwaArHYbE531g6dL6oviNtZp8jFHV0UImKSmFukkxbpLWl7ndA+Lu8oGY
 O4GvIQDbuOlH53XlI3o9o9Q7LzMw76aI9PydClqw=
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 08:27:16 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 6/8] iommu/arm-smmu: Add impl hook for inherit boot
 mappings
In-Reply-To: <20200904155513.282067-7-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-7-bjorn.andersson@linaro.org>
Message-ID: <010101747c469b9b-54b9f965-f182-41c6-a91d-d83ae42917f0-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-09-04 21:25, Bjorn Andersson wrote:
> Add a new operation to allow platform implementations to inherit any
> stream mappings from the boot loader.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
