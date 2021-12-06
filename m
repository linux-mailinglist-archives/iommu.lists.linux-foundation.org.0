Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 826D74694A7
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 12:00:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D7760B78;
	Mon,  6 Dec 2021 11:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yajb-3xAb_Fo; Mon,  6 Dec 2021 11:00:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 39EAC60B71;
	Mon,  6 Dec 2021 11:00:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E095C0071;
	Mon,  6 Dec 2021 11:00:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 392E1C0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 11:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11CF2406AA
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 11:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nltEwVeSVfez for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 11:00:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B62FE405F3
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 11:00:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E865337E; Mon,  6 Dec 2021 12:00:43 +0100 (CET)
Date: Mon, 6 Dec 2021 12:00:40 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH] iommu: log iova range in map/unmap trace events
Message-ID: <Ya3tWNU6hhuXOH2J@8bytes.org>
References: <20211104071620.27290-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211104071620.27290-1-dafna.hirschfeld@collabora.com>
Cc: iommu@lists.linux-foundation.org, kernel@collabora.com, will@kernel.org
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

On Thu, Nov 04, 2021 at 09:16:20AM +0200, Dafna Hirschfeld wrote:
> In case of an iommu page fault, the faulting iova is logged in
> trace_io_page_fault. It is therefore convenient to log the
> iova range in mapping/unmapping trace events so that it is
> easier to see if the faulting iova was recently in any of
> those ranges.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  include/trace/events/iommu.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied, thanks.

Next time, please start the subject after 'iommu:' with a capital
letter.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
