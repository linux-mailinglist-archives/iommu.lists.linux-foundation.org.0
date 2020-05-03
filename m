Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C51C2E8A
	for <lists.iommu@lfdr.de>; Sun,  3 May 2020 20:39:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B81A988521;
	Sun,  3 May 2020 18:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kRu6Yau3DbC; Sun,  3 May 2020 18:39:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0C6FD88520;
	Sun,  3 May 2020 18:39:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7560C0175;
	Sun,  3 May 2020 18:39:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD88EC0175
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 18:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C525C20470
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 18:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5jHzpZ6XzrD for <iommu@lists.linux-foundation.org>;
 Sun,  3 May 2020 18:39:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 1404620363
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 18:39:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 191A2452; Sun,  3 May 2020 20:39:29 +0200 (CEST)
Date: Sun, 3 May 2020 20:39:27 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [RFC PATCH] iommu/amd: fix a race in fetch_pte()
Message-ID: <20200503183927.GA18353@8bytes.org>
References: <20200418121022.GA6113@8bytes.org>
 <57CBF6B2-4745-4E36-9AA5-7E0876E3DA8F@lca.pw>
 <20200418183429.GH21900@8bytes.org>
 <7D03A3E2-647B-4FAD-886D-EE2764EC1EDB@lca.pw>
 <20200429112014.GN21900@8bytes.org>
 <E351FE35-3130-48B0-90ED-BC55469C73F7@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E351FE35-3130-48B0-90ED-BC55469C73F7@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Qian,

On Sun, May 03, 2020 at 09:04:03AM -0400, Qian Cai wrote:
> > On Apr 29, 2020, at 7:20 AM, Joerg Roedel <joro@8bytes.org> wrote:
> > Can you please test this branch:
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=amd-iommu-fixes
> > 
> > It has the previous fix in it and a couple more to make sure the
> > device-table is updated and flushed before increase_address_space()
> > updates domain->pt_root.
> 
> I believe this closed the existing races as it had survived for many
> days. Great work!

Thanks a lot for testing these changes! Can I add your Tested-by when I
send them to the mailing list tomorrow?

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
