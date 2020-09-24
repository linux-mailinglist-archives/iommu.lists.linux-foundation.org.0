Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F1E276F08
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 12:52:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1A08D2E10B;
	Thu, 24 Sep 2020 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KkRhQ2NuKZs9; Thu, 24 Sep 2020 10:52:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 08D842E101;
	Thu, 24 Sep 2020 10:52:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8A42C0051;
	Thu, 24 Sep 2020 10:52:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F133AC0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB92586BAC
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cd1iynbIg4-M for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 10:52:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4E23586BA8
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:52:03 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D8328295; Thu, 24 Sep 2020 12:52:01 +0200 (CEST)
Date: Thu, 24 Sep 2020 12:52:00 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v2 0/3] amd : iommu : Initial IOMMU support for SNP
Message-ID: <20200924105200.GP27174@8bytes.org>
References: <20200923121347.25365-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923121347.25365-1-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Jon.Grimm@amd.com, brijesh.singh@amd.com,
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

On Wed, Sep 23, 2020 at 12:13:44PM +0000, Suravee Suthikulpanit wrote:
> Suravee Suthikulpanit (3):
>   iommu: amd: Use 4K page for completion wait write-back semaphore
>   iommu: amd: Add support for RMP_PAGE_FAULT and RMP_HW_ERR
>   iommu: amd: Re-purpose Exclusion range registers to support SNP CWWB

Applied, thanks. I am slightly concerned about the re-purposing of the
exclusion-range registers based on a feature bit being set. This makes
the hardware incompatible to older IOMMU drivers which do not check the
FEATURE_SNP bit.

It will probably work in this case, as the firmware on systems with
IOMMU-SNP support will not declare exclusion ranges at all and
exclusion-ranges in the IOMMU hardware have been a bad idea since
forever, but it would have been nicer if hardware actually
provided a bit to enable this behavior.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
