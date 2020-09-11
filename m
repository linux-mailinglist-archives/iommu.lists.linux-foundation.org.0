Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DF3265B4D
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 10:17:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A806320774;
	Fri, 11 Sep 2020 08:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylb586iv+7mE; Fri, 11 Sep 2020 08:17:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 101B2204FE;
	Fri, 11 Sep 2020 08:17:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0298FC0051;
	Fri, 11 Sep 2020 08:17:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FBADC0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8859C20774
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4oerNFDPNQe for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 08:16:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-188.smtp-out.us-west-2.amazonses.com
 (a27-188.smtp-out.us-west-2.amazonses.com [54.240.27.188])
 by silver.osuosl.org (Postfix) with ESMTPS id A4441204FE
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812219;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=sWqVcwjm5FNynpqVYJsxE5W+DApHV2ECDPYWHgy9rMM=;
 b=mq8RH5rHcZWWS2qwq6WSr5gB2x5DuJmTu9cKDn8U4gRmViIfbjFa8OVnIiT96lbV
 +EX3EJ4N/TJizAZzJd5KkP+c0n2fMnxyK2LC0hsIx5Nhi6dLmAX0STYBqXrUW713iqG
 +J6EM13SDQ/2PRiUpQUNwsKy3pl2WGv912WfxidI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812219;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=sWqVcwjm5FNynpqVYJsxE5W+DApHV2ECDPYWHgy9rMM=;
 b=n5Me0UYpPNbb/MxE1rgUksQPL8LSI3BnQ1r//3Z+QYWqenIawHuuJ8dLyVy/hFBN
 XzNzpeapHqbCEJP4OggHDNfeNeNkI4NdAyNsNWaGPFCR/FXIEwIfBzXSgJE+1Pb3oDs
 r+Q8aGrIhRkYhFwsxeWRpTPbK8mkSCkMKgLeRAIQ=
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 08:16:58 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 0/8] iommu/arm-smmu: Support maintaining bootloader
 mappings
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
Message-ID: <010101747c3d2f1f-129421b0-6cc9-4f59-a357-e2b7c78ba89f-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.188
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

Hi Bjorn,

On 2020-09-04 21:25, Bjorn Andersson wrote:
> Based on previous attempts and discussions this is the latest attempt 
> at
> inheriting stream mappings set up by the bootloader, for e.g. boot 
> splash or
> efifb.
> 
> Per Will's request this builds on the work by Jordan and Rob for the 
> Adreno
> SMMU support. It applies cleanly ontop of v16 of their series, which 
> can be
> found at
> https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/
> 

Thanks for working on this, I have tested this on qcom platforms
where firmware does these shenanigans(most android) and this series
works well and where firmware doesn't do all this (chrome) and no
regressions there. Review and test tags given on individual patches.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
