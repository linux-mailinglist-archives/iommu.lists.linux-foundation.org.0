Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5592B71C7
	for <lists.iommu@lfdr.de>; Tue, 17 Nov 2020 23:43:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0F32F22708;
	Tue, 17 Nov 2020 22:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9iEDgN8mXWk7; Tue, 17 Nov 2020 22:43:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EF8C9226FC;
	Tue, 17 Nov 2020 22:43:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1336C07FF;
	Tue, 17 Nov 2020 22:43:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 148F6C07FF
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 22:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EC044226FC
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 22:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6W6q7rNqa53 for <iommu@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 22:43:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 02BAB203EE
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 22:43:11 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6120E20709;
 Tue, 17 Nov 2020 22:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605652991;
 bh=0SFBsqaNbJ3KLyPX1uMM76O7e/5+G6SX1GOQxGY2lSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t77rKKLuLqLBsLIsln15cG9Bd24C8388FbOO1O3Fn590nTBPfZHjEXmGFpUNj2eXA
 jj652eSTeTo7sXjohtTNp4+olWdnP2G5cpwGJY1/flcNXKiKY3ewaum/GPBreA/UzN
 sGCiWf+SL3u1DxlMjpnwbNoDqh8fbB0TmjS0lwEM=
Date: Tue, 17 Nov 2020 22:43:07 +0000
From: Will Deacon <will@kernel.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v3 00/14] iommu/amd: Add Generic IO Page Table Framework
 Support
Message-ID: <20201117224306.GE524@willie-the-truck>
References: <20201004014549.16065-1-suravee.suthikulpanit@amd.com>
 <f28359ed-47dc-281f-7261-6320150ef906@amd.com>
 <eb567d23-b63b-a10a-d0b1-c03281a1f602@amd.com>
 <4dce5bdb-1a08-75ad-fd41-a1686521fef1@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4dce5bdb-1a08-75ad-fd41-a1686521fef1@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hey Suravee (it's been a while!),

On Fri, Nov 13, 2020 at 12:57:18PM +0700, Suravee Suthikulpanit wrote:
> Please ignore to include the V3. I am working on V4 to resubmit.

Please can you put me on CC for that?

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
