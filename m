Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 33110219CA1
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 11:55:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF7B387D9C;
	Thu,  9 Jul 2020 09:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsIgcrskhnFn; Thu,  9 Jul 2020 09:55:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DE3D87D61;
	Thu,  9 Jul 2020 09:55:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 503C7C016F;
	Thu,  9 Jul 2020 09:55:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D8B9C016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 09:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F1B2526698
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 09:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqAcgwzjvmfZ for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 09:55:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F0B3262D1
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 09:55:01 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97C0B20708;
 Thu,  9 Jul 2020 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594288500;
 bh=WYBY1L9rfI/f0RydLUyxDK/WRY5EDDEKQJfFVEthvWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qyIDax7m4TgyTLCIp1Q0JmUO/W17WT2VrZkfCFZhRj0wnjnQVtubhoNQCrUfRNWX3
 YQwF15pmfIbAhMsdH21mRA8Zy6jobjhUW+P7CuBXQVfaXvcTXdXHzgY1fbBSojbzBl
 rvMz+4Bg+kLLdQhb+1f+qY+3KyAjYtGow1gytM0Y=
From: Will Deacon <will@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: smmu/USB nodes and HDK855/HDK865
 dts
Date: Thu,  9 Jul 2020 10:54:39 +0100
Message-Id: <159428494402.676142.15012748158989141396.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200609194030.17756-1-jonathan@marek.ca>
References: <20200609194030.17756-1-jonathan@marek.ca>
MIME-Version: 1.0
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, Andy Gross <agross@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, 9 Jun 2020 15:40:18 -0400, Jonathan Marek wrote:
> Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> 
> Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> few changes. Notably, the HDK865 dts has regulator config changed a bit based
> on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> 
> V2 changes:
> * Added two patches for sm8150 and sm8250 iommu compatibles
> * Changed apps_smmu node patches to use new compatibles
> * Updated commit messages for apps_smmu patches to be more correct
> * Updated HDK dts patches based on Bjorn's comments
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] dt-bindings: arm-smmu: Add sm8150 and sm8250 compatible strings
      https://git.kernel.org/will/c/7b6b70d88b10
[2/2] iommu: arm-smmu-impl: Use qcom impl for sm8150 and sm8250 compatibles
      https://git.kernel.org/will/c/2c5c3cfb2da5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
