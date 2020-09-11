Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B896B265B9E
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 10:29:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 623CE86D01;
	Fri, 11 Sep 2020 08:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCSlsDcXNeWM; Fri, 11 Sep 2020 08:29:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F366586934;
	Fri, 11 Sep 2020 08:29:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA440C0051;
	Fri, 11 Sep 2020 08:29:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0806C0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EC5AF86C3A
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fz5CN3SdDUSS for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 08:29:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-10.smtp-out.us-west-2.amazonses.com
 (a27-10.smtp-out.us-west-2.amazonses.com [54.240.27.10])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4424686C82
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812965;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=wF0V9zhnfPcH616CwCLeByLepfZtHk7S+uGcjuckYGg=;
 b=f+ZMmOekXi9cn+9hRPyMgh7YzYMiE9jXIj2m8ouWgXlde59JL9iuNZPHncJyyhUs
 M0Iez9opoZaEZEOhLjE6rW0YyXjJ2rU5smcUdRZzvam0Vx9ylF7+UOknrTLJDosqeJI
 rcmJTrNQ67FHwWBYwe9CjZzF3q3axeeuqGawGsbY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812965;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=wF0V9zhnfPcH616CwCLeByLepfZtHk7S+uGcjuckYGg=;
 b=Ho9pIR8uRj2sQzK63H2DQmEtr69GOhUQICT3u9TcqNH6CfNhhisvOXw2GNYre0qr
 b14mnDxYpx/7xN4IgbWmebpwmYZna9KmEG29UQrj0cxlRxSbepc33v6s34XHp84sL8/
 iMH3LvyMDHuzj1zEIYnjQnnKf/+gi5u7x7iqnitw=
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 08:29:25 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 8/8] iommu/arm-smmu-qcom: Setup identity domain for
 boot mappings
In-Reply-To: <20200904155513.282067-9-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-9-bjorn.andersson@linaro.org>
Message-ID: <010101747c489541-d4c20db7-fb22-4137-a724-21695a350114-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.10
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
> With many Qualcomm platforms not having functional S2CR BYPASS a
> temporary IOMMU domain, without translation, needs to be allocated in
> order to allow these memory transactions.
> 
> Unfortunately the boot loader uses the first few context banks, so
> rather than overwriting a active bank the last context bank is used and
> streams are diverted here during initialization.
> 
> This also performs the readback of SMR registers for the Qualcomm
> platform, to trigger the mechanism.
> 
> This is based on prior work by Thierry Reding and Laurentiu Tudor.
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
