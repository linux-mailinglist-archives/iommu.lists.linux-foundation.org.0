Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C656B2EB528
	for <lists.iommu@lfdr.de>; Tue,  5 Jan 2021 23:07:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88122855D7;
	Tue,  5 Jan 2021 22:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYzyL0A1UZ3A; Tue,  5 Jan 2021 22:07:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30389855BE;
	Tue,  5 Jan 2021 22:07:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 293ECC013A;
	Tue,  5 Jan 2021 22:07:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C345BC013A
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jan 2021 22:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BD00386F1B
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jan 2021 22:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hr4djVqCypil for <iommu@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 22:07:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6BD38871D5
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jan 2021 22:07:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6515622EBE;
 Tue,  5 Jan 2021 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609884434;
 bh=6X9xh0B9e7jk8zQM37gLnc6Rfvt46/YI3ULCrl4E+0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ExbI2M6Ui3QyfRBhdrUi7GpiKAJoN6lx5R4MfJLgOWjxo94nPJ2V6ghl3wUF/luK7
 Y0Q6HsQvwtYkanU46yCVavoHUnH5sOBwbPdiVrKV2KqLeq+jPejkwETiOqTJFFYUGR
 n77h+H235XHE9447prM8u7AkJflwIH/tp1Xvr/lhDRUjb8WI1y1kqU0gb0DUOWmmLp
 otXxR6PDgOlhl3n7yom/QPeXzid6FSzwyZKoajluUI1Zvm6uyrY5TZPPb7nKIREldm
 NHuVs4IhlmtOgs/wOgCntK7Gr/o9Z9uE/NSJvYaX07Wn0a/KHW3hHCyqmhxZYM4VAu
 PNsHZdQiXlrVg==
From: Will Deacon <will@kernel.org>
To: Johnathan Smithinovic <johnathan.smithinovic@gmx.at>, mingo@redhat.com,
 David Woodhouse <dwmw2@infradead.org>, tglx@linutronix.de, bp@alien8.de
Subject: Re: [PATCH] iommu/amd: Stop irq_remapping_select() matching when
 remapping is disabled
Date: Tue,  5 Jan 2021 22:07:02 +0000
Message-Id: <160987465284.30865.16684216909917986687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <04bbe8bca87f81a3cfa93ec4299e53f47e00e5b3.camel@infradead.org>
References: <ed4be9b4-24ac-7128-c522-7ef359e8185d@gmx.at>
 <04bbe8bca87f81a3cfa93ec4299e53f47e00e5b3.camel@infradead.org>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu <iommu@lists.linux-foundation.org>,
 kernel-team@android.com
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

On Tue, 05 Jan 2021 01:36:13 +0000, David Woodhouse wrote:
> The AMD IOMMU initialisation registers the IRQ remapping domain for
> each IOMMU before doing the final sanity check that every I/OAPIC is
> covered.
> 
> This means that the AMD irq_remapping_select() function gets invoked
> even when IRQ remapping has been disabled, eventually leading to a NULL
> pointer dereference in alloc_irq_table().
> 
> [...]

Applied to arm64 (for-next/iommu/fixes), thanks!

[1/1] iommu/amd: Stop irq_remapping_select() matching when remapping is disabled
      https://git.kernel.org/arm64/c/b34f10c2dc59

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
