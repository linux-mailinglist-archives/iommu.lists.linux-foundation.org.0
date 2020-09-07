Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E5260504
	for <lists.iommu@lfdr.de>; Mon,  7 Sep 2020 21:05:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 151B787151;
	Mon,  7 Sep 2020 19:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgO44uPEBQXk; Mon,  7 Sep 2020 19:05:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34EFB86FB4;
	Mon,  7 Sep 2020 19:05:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BAADC0051;
	Mon,  7 Sep 2020 19:05:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9864FC0051
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 18:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 761FD20788
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 18:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZ8jnWpaPeH8 for <iommu@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 18:57:56 +0000 (UTC)
X-Greylist: delayed 00:08:24 by SQLgrey-1.7.6
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by silver.osuosl.org (Postfix) with ESMTPS id 8E33E20535
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 18:57:56 +0000 (UTC)
Date: Mon, 07 Sep 2020 18:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1599504570;
 bh=ZMHD4pb6eLStL6z+QcCKhBat0AGNJTHtmNZKUYPW0hY=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=LsH3Ubg/tM9MN5ir7XnQ3WLf4Kqa4Ok1LVbdc5dOfguhK0D8iWntPUNb2AniTkGTr
 t6yGWMWn/awny7KYCVDQBarjP4Vi8tM8RXu67wPoDYP+mLUrqSnec1IuJEjL6LF5B4
 4xqRBsAXkGGnM0YxTvto9ec9z8+VlwPh1j+w36W4=
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@chromium.org>
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v3 0/8] iommu/arm-smmu: Support maintaining bootloader
 mappings
Message-ID: <c1cce546-0c49-05e2-8c54-5f343db273c8@connolly.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Sep 2020 19:05:14 +0000
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-09-04 16:55, Bjorn Andersson wrote:
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash or
> efifb.
>
> Per Will's request this builds on the work by Jordan and Rob for the Adreno
> SMMU support. It applies cleanly ontop of v16 of their series, which can be
> found at
> https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/
>
> Bjorn Andersson (8):
>    iommu/arm-smmu: Refactor context bank allocation
>    iommu/arm-smmu: Delay modifying domain during init
>    iommu/arm-smmu: Consult context bank allocator for identify domains
>    iommu/arm-smmu-qcom: Emulate bypass by using context banks
>    iommu/arm-smmu-qcom: Consistently initialize stream mappings
>    iommu/arm-smmu: Add impl hook for inherit boot mappings
>    iommu/arm-smmu: Provide helper for allocating identity domain
>    iommu/arm-smmu-qcom: Setup identity domain for boot mappings
>
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 111 ++++++++++++++++++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 122 ++++++++++++++-------
>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  14 ++-
>   3 files changed, 205 insertions(+), 42 deletions(-)
>

Tested on the OnePlus 6 (SDM845), allows booting with display enabled.



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
