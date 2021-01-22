Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE6300483
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 14:49:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 92CAE87390;
	Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OB9vpTSxUQA; Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3BF268738E;
	Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36740C013A;
	Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1AF6C08A1
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 935CD2E107
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0H1HrJj7-2Z for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 13:49:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 004AD226F3
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1339023A03;
 Fri, 22 Jan 2021 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611323384;
 bh=ATGg834zTjJdh8VUvM7w7CzgPmIsq9O4h4GoJ1kWZVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c5LtdfjyO0ZJ2wQDdYwmQ4PqiVRch4YhpzCOMXbf0r0S7nuVSVA1jIjWE9dC+tHL4
 KWOdvanqNypQJ07oVpa2sscyyVLOiKwFzXZPJUCCuf8bCfCrnGSABRiknluMJmk7Rj
 a/0Uy0RBlsq8Xh124Ljo4RMqB4854HffS2HTDcqaWWQBUu4+kRCt0GRIN07+wLXBhe
 /lkGqupa4PqqJkWlg2hZC0XcQuLrveaBIKYj/k/xDpnFHI/JLxfHD5dH/5ZZHZHn/q
 DWOTARY7saHkKmti1FJ9U7Yioy+QjHefkFSLS7gbEYaeds1zvwLIl4s1fwm/VlJcLP
 axaoW6gFiCMvg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: Use DEFINE_RES_MEM() to simplify
 code
Date: Fri, 22 Jan 2021 13:49:33 +0000
Message-Id: <161132233107.235458.16848048173103026904.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122131448.1167-1-thunder.leizhen@huawei.com>
References: <20210122131448.1167-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
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

On Fri, 22 Jan 2021 21:14:48 +0800, Zhen Lei wrote:
> No functional change.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Use DEFINE_RES_MEM() to simplify code
      https://git.kernel.org/will/c/932bc8c7d742

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
