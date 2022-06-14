Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E816454ABD0
	for <lists.iommu@lfdr.de>; Tue, 14 Jun 2022 10:30:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9945060F02;
	Tue, 14 Jun 2022 08:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHB6FgifFllA; Tue, 14 Jun 2022 08:30:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C5A9960F24;
	Tue, 14 Jun 2022 08:30:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94A1BC007C;
	Tue, 14 Jun 2022 08:30:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C928AC002D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 08:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C57724098E
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 08:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RZhw0ViiE30F for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 08:30:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A7D740983
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 08:30:24 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BE31D564; Tue, 14 Jun 2022 10:30:21 +0200 (CEST)
Date: Tue, 14 Jun 2022 10:30:20 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: New IOMMU mailing list coming
Message-ID: <YqhHHBkvGL74azMg@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
Cc: robin.murphy@arm.com, Alex Williamson <alex.williamson@redhat.com>,
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
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

Hi all,

after several problems with the current IOMMU mailing list (no DKIM
support, poor b4 interoperability) we have decided to move the IOMMU
development discussions to a new list hosted at lists.linux.dev.

The new list is up and running already, to subscribe please send an
email to iommu+subscribe@lists.linux.dev. It is not yet archived, but
there will be a hard switch between the old and the new list on

	July 5th, 2022

After that date the old list will no longer work and the archive will
switch to the new mailing list.

Sorry for any inconveniences this might cause.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
