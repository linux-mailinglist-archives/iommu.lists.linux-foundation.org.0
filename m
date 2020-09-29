Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BF27D437
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 19:13:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3ACE28712F;
	Tue, 29 Sep 2020 17:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G70U0Qyt5oxF; Tue, 29 Sep 2020 17:13:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE44187136;
	Tue, 29 Sep 2020 17:13:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE4D8C016F;
	Tue, 29 Sep 2020 17:13:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05F4BC016F
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 17:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E569087150
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 17:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2JHGMHtHd9V for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:13:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 84C248712F
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 17:13:22 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D133D2071E;
 Tue, 29 Sep 2020 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601399601;
 bh=60VTZlLteB5DJP1R0FZbTxHInz53+hwtLpTUiLt8T6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=axvy8lErPyqNZ3jGLIFC8qXDKXY9b+eqnRrobIvGS9PceOtri38KW3J1frp+nF5QT
 U84jiQQU5cc4yt29DkUl0uMANHgA3GmvKLorMKEcBoquvb/7BkkkhGHVwGOTBk9/bl
 Nz7Mi+eawC1M1+zsnpbEjgrjY589QwwtYjB9BbGI=
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org,
	robdclark@gmail.com,
	Yu Kuai <yukuai3@huawei.com>
Subject: Re: [PATCH V2] iommu/qcom: add missing put_device() call in
 qcom_iommu_of_xlate()
Date: Tue, 29 Sep 2020 18:13:12 +0100
Message-Id: <160139315360.1642555.11996914864998591532.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929014037.2436663-1-yukuai3@huawei.com>
References: <20200929014037.2436663-1-yukuai3@huawei.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, yi.zhang@huawei.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, kernel-team@android.com,
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

On Tue, 29 Sep 2020 09:40:37 +0800, Yu Kuai wrote:
> if of_find_device_by_node() succeed, qcom_iommu_of_xlate() doesn't have
> a corresponding put_device(). Thus add put_device() to fix the exception
> handling for this function implementation.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/qcom: add missing put_device() call in qcom_iommu_of_xlate()
      https://git.kernel.org/will/c/e2eae09939a8

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
