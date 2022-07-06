Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2ED56830A
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 11:12:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92C5760D7F;
	Wed,  6 Jul 2022 09:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C5760D7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2_CSk8YptGc; Wed,  6 Jul 2022 09:12:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9793060D75;
	Wed,  6 Jul 2022 09:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9793060D75
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D927C0070;
	Wed,  6 Jul 2022 09:12:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90B4EC002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 09:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70A724047D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 09:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A724047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-DsXv8k8d7x for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 09:11:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24E014016A
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24E014016A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 09:11:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id EAA4C4CC; Wed,  6 Jul 2022 11:11:53 +0200 (CEST)
Date: Wed, 6 Jul 2022 11:11:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v1 7/7] iommu/amd: Introduce amd_iommu_pgtable
 command-line option
Message-ID: <YsVR1DSHHQ9iTkQJ@8bytes.org>
References: <20220603112107.8603-1-vasant.hegde@amd.com>
 <20220603112107.8603-8-vasant.hegde@amd.com>
 <YrQgXfPWjsHvQLij@8bytes.org>
 <19df95e3-3598-8414-0201-1ebc30b6f159@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19df95e3-3598-8414-0201-1ebc30b6f159@amd.com>
Cc: iommu@lists.linux-foundation.org
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

On Tue, Jun 28, 2022 at 01:23:52PM +0530, Vasant Hegde wrote:
> I think it will complicate the parsing logic. We do have `amd_iommu=off` option.
> How are we going to handle `amd_iommu=off,[pgtable_v1/v2]` ? 

In that case everything except 'off' will be ignored. The driver might
set its internal variables, but this has no effect as the driver never
initializes.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
