Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B32E76BB
	for <lists.iommu@lfdr.de>; Wed, 30 Dec 2020 08:02:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1ECFB87181;
	Wed, 30 Dec 2020 07:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXsqW9rLno3u; Wed, 30 Dec 2020 07:02:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 851BA8717D;
	Wed, 30 Dec 2020 07:02:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 678A1C0174;
	Wed, 30 Dec 2020 07:02:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D110C0174
 for <iommu@lists.linux-foundation.org>; Wed, 30 Dec 2020 07:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 626798717D
 for <iommu@lists.linux-foundation.org>; Wed, 30 Dec 2020 07:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9Nd+MWQYNct for <iommu@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 07:02:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C6D4D8717B
 for <iommu@lists.linux-foundation.org>; Wed, 30 Dec 2020 07:02:51 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0ae90058345bc89b9c20d2.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:e900:5834:5bc8:9b9c:20d2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E357E1EC04F0;
 Wed, 30 Dec 2020 08:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1609311768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=IVIq9v7uhd13qBpMQD16SmyiUO8UUvqpILGYkZ47HJo=;
 b=jq3k8zvDtJx6/tM/0+ZBgmlGDufmiW5hdO4HCuUJymq1D4Rabnx9CJMwz/OkGeCrPTJqqq
 dQVpIuosWm5FRr4E5snOgvGaJsrqLzdIgV0akYeADZppnBBQczJSwEZ8awF8gGCFXStV3q
 UiRy1KBwaTCCRMS6Imljj6Doo4kzQFw=
Date: Wed, 30 Dec 2020 08:02:44 +0100
From: Borislav Petkov <bp@alien8.de>
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: Re: [PATCH] x86/iommu: Fix two minimal issues in check_iommu_entries()
Message-ID: <20201230070244.GA22022@zn.tnic>
References: <20201223062412.343-1-zhenzhong.duan@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201223062412.343-1-zhenzhong.duan@gmail.com>
Cc: will@kernel.org, konrad.wilk@oracle.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 mingo@redhat.com, joe@perches.com, tglx@linutronix.de, zhongjiang@huawei.com
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

On Wed, Dec 23, 2020 at 02:24:12PM +0800, Zhenzhong Duan wrote:
> check_iommu_entries() checks for cyclic dependency in iommu entries
> and fixes the cyclic dependency by setting x->depend to NULL. But
> this repairing isn't correct if q is in front of p, there will be
> "EXECUTION ORDER INVALID!" report following. Fix it by NULLing
> whichever in the front.

When does "q is in front of p" happen? How does it happen?

> The second issue is about the report of exectuion order reverse,
> the order is reversed incorrectly in the report, fix it.

I have no clue what that means.

Plese structure your commit message something like this:

Problem is A.

It happens because of B.

Fix it by doing C.

(Potentially do D).

For more detailed info, see
Documentation/process/submitting-patches.rst, Section "2) Describe your
changes".

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
