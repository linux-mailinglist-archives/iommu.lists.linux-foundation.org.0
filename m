Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 88358265B8C
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 10:26:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EDAA87184;
	Fri, 11 Sep 2020 08:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Avu6ZBK2Lf5r; Fri, 11 Sep 2020 08:26:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3569871CF;
	Fri, 11 Sep 2020 08:26:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E29CC0051;
	Fri, 11 Sep 2020 08:26:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C993C0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 14BFC2050F
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yb4kqzWaQq11 for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 08:26:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 by silver.osuosl.org (Postfix) with ESMTPS id B728B20488
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812789;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=Suw0PG/fZ1BCpafDijGnb5vPJXoo0m2bMenuQ7bZnxg=;
 b=YZHpz7zg1Cu0qhv83FPE6NWAC7WlSwEtiOXARvCDQr20bvKgnGPmwHqvNUJBpCX4
 7CNb5MCk1fhe6W5nMqhjuTmnsB4Tm+zpVxxyiYBXpC5Bz3wGbCe1oE90VGdLfZZ1+aW
 SLY/Cm8lSwySonFGCHkU//fvW2TlO3Lg2uvlIAsc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812789;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=Suw0PG/fZ1BCpafDijGnb5vPJXoo0m2bMenuQ7bZnxg=;
 b=TjcbcC5BztunLJIsLKkXHJ1DLlhN2TUk0slIpNsYDWa32HaMQMr1yUgD2mkGupSw
 cMM36FVaxIFbh/35/rWgCnWwcxggH65rfLUH2pUgWOrbe1OBcAQxav6LI52yZu77/4J
 udM5R8k4ceBMramNqwmHxvMNZ07/JajjZQEKE9/k=
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 08:26:29 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 5/8] iommu/arm-smmu-qcom: Consistently initialize
 stream mappings
In-Reply-To: <20200904155513.282067-6-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-6-bjorn.andersson@linaro.org>
Message-ID: <010101747c45e39e-44b2bd3b-8045-48f3-9430-92dc61d0c0ea-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.187
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
> Firmware that traps writes to S2CR to translate BYPASS into FAULT also
> ignores writes of type FAULT. As such booting with "disable_bypass" set
> will result in all S2CR registers left as configured by the bootloader.
> 
> This has been seen to result in indeterministic results, as these
> mappings might linger and reference context banks that Linux is
> reconfiguring.
> 
> Use the fact that BYPASS writes result in FAULT type to force all 
> stream
> mappings to FAULT.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

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
