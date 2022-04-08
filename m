Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94B4F9228
	for <lists.iommu@lfdr.de>; Fri,  8 Apr 2022 11:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD85041BD1;
	Fri,  8 Apr 2022 09:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RooxT8b6keGk; Fri,  8 Apr 2022 09:40:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D806741C51;
	Fri,  8 Apr 2022 09:40:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD409C002C;
	Fri,  8 Apr 2022 09:40:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A28CC002C
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 09:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68BAE83F4A
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 09:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FdTpJnhnOhIv for <iommu@lists.linux-foundation.org>;
 Fri,  8 Apr 2022 09:40:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from muru.com (muru.com [72.249.23.125])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E1F183F3E
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 09:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 6319C807E;
 Fri,  8 Apr 2022 09:38:00 +0000 (UTC)
Date: Fri, 8 Apr 2022 12:40:23 +0300
From: Tony Lindgren <tony@atomide.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/omap: Fix regression in probe for NULL pointer
 dereference
Message-ID: <YlADB4zeG+kwt7Oj@atomide.com>
References: <20220331062301.24269-1-tony@atomide.com>
 <Yk54+S0iaMueWN63@atomide.com> <Yk/xe3Wq34V/0AJf@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yk/xe3Wq34V/0AJf@8bytes.org>
Cc: linux-omap@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Hi,

* Joerg Roedel <joro@8bytes.org> [220408 08:23]:
> On Thu, Apr 07, 2022 at 08:39:05AM +0300, Tony Lindgren wrote:
> > Can you guys please get this fix into the -rc series? Or ack it so
> > I can pick it up into my fixes branch?
> 
> Sorry for the delay, Covid catched me so I was away from email for
> almost 2 week. This patch is picked-up now and I will send it upstream
> for -rc2.

OK welcome back then, and hopefully no serious symptoms. Thanks for
picking up the patch.

Regards,

Tony
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
