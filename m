Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F98569BCD
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 09:41:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF4E83EF7;
	Thu,  7 Jul 2022 07:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF4E83EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmHofCOl0XkY; Thu,  7 Jul 2022 07:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 904CD83EE0;
	Thu,  7 Jul 2022 07:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 904CD83EE0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AC53C0077;
	Thu,  7 Jul 2022 07:41:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7ECF0C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 07:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5897A610DE
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 07:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5897A610DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWNhuqzQ1uDh for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 07:41:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3732A607C9
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3732A607C9
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 07:41:49 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C1678423; Thu,  7 Jul 2022 09:41:45 +0200 (CEST)
Date: Thu, 7 Jul 2022 09:41:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v3 RESEND 00/35] iommu/amd: Add multiple PCI segments
 support
Message-ID: <YsaOOBuJZSUT1C2B@8bytes.org>
References: <20220706113825.25582-1-vasant.hegde@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706113825.25582-1-vasant.hegde@amd.com>
Cc: iommu@lists.linux.dev, iommu@lists.linux-foundation.org
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

On Wed, Jul 06, 2022 at 05:07:50PM +0530, Vasant Hegde wrote:
>    As discussed in other thread, I have updated "From:" tag and
>    resending patchset. No changes in the actual patch content.
>    This patchset is based on top on "iommu/x86/amd" branch.
>    Base commit : 0d10fe75911787 ("iommu/amd: Use try_cmpxchg64 in ....")

Replaced it in my tree, thanks. I now also added a hook calling
checkpatch, which should catch such problems before I push the tree out.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
