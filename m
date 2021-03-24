Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AAD347228
	for <lists.iommu@lfdr.de>; Wed, 24 Mar 2021 08:13:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B03484970;
	Wed, 24 Mar 2021 07:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3UiQeQlb-EH; Wed, 24 Mar 2021 07:13:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B4248496E;
	Wed, 24 Mar 2021 07:13:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F9D9C0012;
	Wed, 24 Mar 2021 07:13:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA58C000A
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 07:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13AE48496F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 07:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCY4xnBdPAiZ for <iommu@lists.linux-foundation.org>;
 Wed, 24 Mar 2021 07:13:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 165358496E
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 07:13:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1FC2268B02; Wed, 24 Mar 2021 08:13:06 +0100 (CET)
Date: Wed, 24 Mar 2021 08:13:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] dma-mapping: make map_benchmark compile into module
Message-ID: <20210324071305.GB647@lst.de>
References: <1616552258-22282-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616552258-22282-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: paulmck@kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
 ast@kernel.org, rostedt@goodmis.org, hch@lst.de,
 iommu@lists.linux-foundation.org, akpm@linux-foundation.org,
 tglx@linutronix.de
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

On Wed, Mar 24, 2021 at 10:17:38AM +0800, Tian Tao wrote:
> under some scenarios, it is necessary to compile map_benchmark
> into module to test iommu, so this patch changed Kconfig and
> export_symbol to implement map_benchmark compiled into module.
> 
> On the other hand, map_benchmark is a driver, which is supposed
> to be able to run as a module.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Nope, we're not going to export more kthread internals for a test
module.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
