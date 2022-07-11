Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9313E56335B
	for <lists.iommu@lfdr.de>; Fri,  1 Jul 2022 14:16:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACFC94020B;
	Fri,  1 Jul 2022 12:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACFC94020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7RY43TKDQT8; Fri,  1 Jul 2022 12:16:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AD11E40119;
	Fri,  1 Jul 2022 12:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD11E40119
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85BF5C002D;
	Fri,  1 Jul 2022 12:16:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C848C002D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 12:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11475827D9
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 12:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11475827D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSS9P688RZpQ for <iommu@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 12:16:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F4EA826E5
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F4EA826E5
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 12:16:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8EB0779E; Fri,  1 Jul 2022 14:16:23 +0200 (CEST)
Date: Fri, 1 Jul 2022 14:16:22 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: Re: New IOMMU mailing list coming
Message-ID: <Yr7lluiS4tz4HPTE@8bytes.org>
References: <YqhHHBkvGL74azMg@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqhHHBkvGL74azMg@8bytes.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Jun 14, 2022 at 10:30:21AM +0200, J=F6rg R=F6del wrote:
> Hi all,
> =

> after several problems with the current IOMMU mailing list (no DKIM
> support, poor b4 interoperability) we have decided to move the IOMMU
> development discussions to a new list hosted at lists.linux.dev.
> =

> The new list is up and running already, to subscribe please send an
> email to iommu+subscribe@lists.linux.dev. It is not yet archived, but
> there will be a hard switch between the old and the new list on
> =

> 	July 5th, 2022
> =

> After that date the old list will no longer work and the archive will
> switch to the new mailing list.
> =

> Sorry for any inconveniences this might cause.

Gentle reminder that the old IOMMU mailing list at
	iommu@lists.linux-foundation.org
	=

will no longer be archived from Tuesday, July 5th on and will disappear
soon after. If not already done, please subscribe to the new mailing
list at

	iomm+subscribe@lists.linux.dev

Thanks and see you over there!


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
