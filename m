Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A521195468
	for <lists.iommu@lfdr.de>; Fri, 27 Mar 2020 10:50:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1B6B52637D;
	Fri, 27 Mar 2020 09:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jngbk8G4PNYP; Fri, 27 Mar 2020 09:50:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4214A2635F;
	Fri, 27 Mar 2020 09:50:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AF31C0177;
	Fri, 27 Mar 2020 09:50:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF82CC0177
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 09:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB9C7894D6
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 09:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYS2e8eleluZ for <iommu@lists.linux-foundation.org>;
 Fri, 27 Mar 2020 09:50:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CA3A1894C5
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 09:50:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9B4532C8; Fri, 27 Mar 2020 10:50:31 +0100 (CET)
Date: Fri, 27 Mar 2020 10:50:29 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] iommu: Lower severity of add/remove device messages
Message-ID: <20200327095029.GB11538@8bytes.org>
References: <20200323214956.30165-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323214956.30165-1-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, kernel@collabora.com,
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

On Mon, Mar 23, 2020 at 06:49:56PM -0300, Ezequiel Garcia wrote:
> These user messages are not really informational,
> but mostly of debug nature. Lower their severity.

Like most other messages in the kernel log, that is not a reason to
lower the severity. These messages are the first thing to look at when
looking into IOMMU related issues.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
