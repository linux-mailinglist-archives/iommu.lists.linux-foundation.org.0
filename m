Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3171A2943
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 21:16:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E804C235A6;
	Wed,  8 Apr 2020 19:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aa6rbOZ05z7; Wed,  8 Apr 2020 19:16:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3470F2353A;
	Wed,  8 Apr 2020 19:16:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A779C0177;
	Wed,  8 Apr 2020 19:16:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62779C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 19:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 59DE386ACE
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 19:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DU-BIhPLCGkp for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 19:16:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1DD94868F9
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 19:16:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B967C68C4E; Wed,  8 Apr 2020 21:16:44 +0200 (CEST)
Date: Wed, 8 Apr 2020 21:16:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] dma-debug: fix displaying of dma allocation type
Message-ID: <20200408191644.GA12239@lst.de>
References: <20200408184804.30522-1-grygorii.strashko@ti.com>
 <20200408184958.GA9945@lst.de> <ccd0cca4-ca89-3ecd-90d5-66e5e4090f41@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccd0cca4-ca89-3ecd-90d5-66e5e4090f41@ti.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Wed, Apr 08, 2020 at 10:13:55PM +0300, Grygorii Strashko wrote:
>>>   -static const char *type2name[5] = { "single", "page",
>>> +static const char *type2name[5] = { "single",
>>>   				    "scather-gather", "coherent",
>>>   				    "resource" };
>>
>> To make sure this doesn't happen anymore, can you switch to
>> named initializers?
>>
>
> Just to clarify.
> Do you mean
> [dma_debug_coherent] = "coherent",
> ?

Yes.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
