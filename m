Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 696211A299D
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 21:50:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21E2A845A0;
	Wed,  8 Apr 2020 19:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Sv56kf7AvN2; Wed,  8 Apr 2020 19:50:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AD05F841D4;
	Wed,  8 Apr 2020 19:50:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DE00C1D85;
	Wed,  8 Apr 2020 19:50:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96EEAC0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 19:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 865D2880CC
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 19:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyM0Cj-urcO1 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 19:50:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 119B587C88
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 19:50:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 038Jo14V094903;
 Wed, 8 Apr 2020 14:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1586375401;
 bh=PiU2nyxYs+ZuZYpfplhJB684M68ejmcd39RGjgjoHo4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oO+ypjTJtQ1+nKZMGj2tJ4IxLqCrnM1YNk6BdZfmVNX4W4eYpITOoHsEOskvz0R6b
 Y5mAssHsmOUvD7H8I69rPtRnj4Vx/aZYHNJFKlDgS74V3/K3SZyH27aplCQ1QLfy+A
 A7nYQTlCzNAZnb5lTyURLc92mz85F6Uy2fVs0ynM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 038Jo1wS056126
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 Apr 2020 14:50:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Apr
 2020 14:50:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Apr 2020 14:50:00 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 038JnsLe093482;
 Wed, 8 Apr 2020 14:49:58 -0500
Subject: Re: [PATCH v2] dma-debug: fix displaying of dma allocation type
To: Christoph Hellwig <hch@lst.de>
References: <20200408194300.21426-1-grygorii.strashko@ti.com>
 <20200408194527.GA13647@lst.de>
Message-ID: <b91b8918-85fd-5d01-7b08-62b510146036@ti.com>
Date: Wed, 8 Apr 2020 22:49:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200408194527.GA13647@lst.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Sekhar Nori <nsekhar@ti.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
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
From: Grygorii Strashko via iommu <iommu@lists.linux-foundation.org>
Reply-To: Grygorii Strashko <grygorii.strashko@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On 08/04/2020 22:45, Christoph Hellwig wrote:
> On Wed, Apr 08, 2020 at 10:43:00PM +0300, Grygorii Strashko wrote:
>> +static const char *type2name[5] = {
>> +	[dma_debug_single] = "single",
>> +	[dma_debug_sg] = "scather-gather",
>> +	[dma_debug_coherent] = "coherent",
>> +	[dma_debug_resource] = "resource",
>> +};
> 
> We actually only have 4, not 5 elements now (and don't really
> need the sizing anyway).  But I can fix that when applying, thanks!
  
Yeah. Sorry and thank you.

-- 
Best regards,
grygorii
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
