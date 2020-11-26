Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DCB2C5A4A
	for <lists.iommu@lfdr.de>; Thu, 26 Nov 2020 18:13:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 24BDB2E282;
	Thu, 26 Nov 2020 17:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8Vb1xPgic-C; Thu, 26 Nov 2020 17:13:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B199D2E280;
	Thu, 26 Nov 2020 17:13:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5C2BC1D9F;
	Thu, 26 Nov 2020 17:13:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEF9AC0052
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 17:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9DF8087533
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 17:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqw8lSW5Hxhm for <iommu@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 17:13:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9C3788752A
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 17:13:38 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E836821D46;
 Thu, 26 Nov 2020 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606410818;
 bh=673uer9AMlba7q94T/YlC/YP5IUGywMCEntCIsFLLWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TJWsouHkC1d6imJM6GtO55xCTjyHPvFVzgd2dBOKHKHpJ0fp/jepv4vI8RB269hah
 2uXk+lFByfjbpJu/R6x2CEOQ2ubHyKbnCz2Fd8tyZaMeUDKQcDDbuq72ROmVZQJt1m
 6WiEWc6a9tPcpPNpdfFlC8LF48f7oulruqkQF+Qk=
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] iommu/vt-d: Don't read VCCAP register unless it exists
Date: Thu, 26 Nov 2020 17:13:32 +0000
Message-Id: <160640222431.1420038.2735372411293730245.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <de32b150ffaa752e0cff8571b17dfb1213fbe71c.camel@infradead.org>
References: <de32b150ffaa752e0cff8571b17dfb1213fbe71c.camel@infradead.org>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, iommu <iommu@lists.linux-foundation.org>,
 kernel-team@android.com, Will Deacon <will@kernel.org>
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

On Thu, 26 Nov 2020 11:13:51 +0000, David Woodhouse wrote:
> My virtual IOMMU implementation is whining that the guest is reading a
> register that doesn't exist. Only read the VCCAP_REG if the corresponding
> capability is set in ECAP_REG to indicate that it actually exists.

Applied to arm64 (for-next/iommu/fixes), thanks!

[1/1] iommu/vt-d: Don't read VCCAP register unless it exists
      https://git.kernel.org/arm64/c/d76b42e92780

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
