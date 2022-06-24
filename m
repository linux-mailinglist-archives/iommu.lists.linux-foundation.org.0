Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD1755927D
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 07:45:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDCAD42552;
	Fri, 24 Jun 2022 05:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDCAD42552
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cqv3KiGthXRr; Fri, 24 Jun 2022 05:45:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8AE3C4251A;
	Fri, 24 Jun 2022 05:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE3C4251A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EC19C0081;
	Fri, 24 Jun 2022 05:45:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA7DEC002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 05:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0CF8610BE
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 05:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0CF8610BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_L8KTIXMRxZ for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 05:45:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7835960B9A
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7835960B9A
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 05:45:39 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3944C672; Fri, 24 Jun 2022 07:45:35 +0200 (CEST)
Date: Fri, 24 Jun 2022 07:45:30 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/vt-d: Fix PCI bus rescan device hot add
Message-ID: <YrVPelnOi9nql/8C@8bytes.org>
References: <20220521002115.1624069-1-yian.chen@intel.com>
 <7149e5dd-c72e-538b-b98f-0fbc89580a95@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7149e5dd-c72e-538b-b98f-0fbc89580a95@linux.intel.com>
Cc: Ravi Shankar <ravi.v.shankar@intel.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

Hi Baolu,

On Wed, May 25, 2022 at 09:40:26AM +0800, Baolu Lu wrote:
> How do you like it? If you agree, I can queue it in my next pull request
> for fixes.

Would it help to tie DMAR and IOMMU components together, so that
selecting DMAR for IRQ remapping also selects IOMMU? The IOMMU can be in
PT mode and I think it would simplify a lot of things.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
