Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4AB35B399
	for <lists.iommu@lfdr.de>; Sun, 11 Apr 2021 13:42:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47D806059B;
	Sun, 11 Apr 2021 11:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyQuxhQh1RAC; Sun, 11 Apr 2021 11:42:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FEE5608DC;
	Sun, 11 Apr 2021 11:42:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41CD6C000A;
	Sun, 11 Apr 2021 11:42:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FC1DC000A
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F3C608E0
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydeWnOJ4armO for <iommu@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 11:42:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 351EB608DC
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:42:49 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id BCED440D3BFF;
 Sun, 11 Apr 2021 11:42:45 +0000 (UTC)
Date: Sun, 11 Apr 2021 14:42:45 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] iommu/amd: Fix extended features logging
In-Reply-To: <6fbc8d6b885771ad4e69fc6789d07fd2b66f01d5.camel@perches.com>
Message-ID: <alpine.LNX.2.20.13.2104111441230.11104@monopod.intra.ispras.ru>
References: <20210410211152.1938-1-amonakov@ispras.ru>
 <6fbc8d6b885771ad4e69fc6789d07fd2b66f01d5.camel@perches.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Cc: Petr Mladek <pmladek@suse.com>, Joerg Roedel <jroedel@suse.de>,
 John Ogness <john.ogness@linutronix.de>, Paul Menzel <pmenzel@molgen.mpg.de>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org
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

On Sun, 11 Apr 2021, Joe Perches wrote:

> (cc'ing the printk maintainers)
> 
[snip]
> 
> This shouldn't be necessary.
> If this is true then a lot of output logging code broke.

See also my response to Paul at
https://lore.kernel.org/lkml/alpine.LNX.2.20.13.2104111410340.11104@monopod.intra.ispras.ru/

Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
