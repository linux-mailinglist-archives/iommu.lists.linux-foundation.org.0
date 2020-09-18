Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CBACC26F7DD
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 10:18:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60F31877C8;
	Fri, 18 Sep 2020 08:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiL3xwUhqK2t; Fri, 18 Sep 2020 08:18:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B56D6877C5;
	Fri, 18 Sep 2020 08:18:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93D03C0051;
	Fri, 18 Sep 2020 08:18:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D81EC0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E977587482
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXHxvOLCBaaW for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 08:18:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 213E386C73
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:18:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 550E4396; Fri, 18 Sep 2020 10:18:42 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:18:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Vijayanand Jitta <vjitta@codeaurora.org>
Subject: Re: [PATCH v2 1/2] iommu/iova: Retry from last rb tree node if iova
 search fails
Message-ID: <20200918081836.GD31590@8bytes.org>
References: <1597927761-24441-1-git-send-email-vjitta@codeaurora.org>
 <782f5dae-4ebc-02c8-5c83-4f7efda65c9d@codeaurora.org>
 <ef272a26-b1c2-f445-4e34-c87f1ce27a01@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef272a26-b1c2-f445-4e34-c87f1ce27a01@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: vinmenon@codeaurora.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org, robin.murphy@arm.com
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

On Mon, Sep 14, 2020 at 10:20:55AM +0530, Vijayanand Jitta wrote:
> ping ?

Robin needs to have a look first.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
