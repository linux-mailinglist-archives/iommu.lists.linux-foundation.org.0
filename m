Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081130C8C6
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 19:02:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9AD7E226D4;
	Tue,  2 Feb 2021 18:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKp6HdHEtbkF; Tue,  2 Feb 2021 18:02:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8A9B522882;
	Tue,  2 Feb 2021 18:02:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B239C013A;
	Tue,  2 Feb 2021 18:02:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60DD5C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 18:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4EB4F85C86
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 18:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NG3wqrLIe3gz for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 18:02:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8A82185C06
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 18:02:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2F92ED1;
 Tue,  2 Feb 2021 10:02:22 -0800 (PST)
Received: from [10.57.49.26] (unknown [10.57.49.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CCAC3F73B;
 Tue,  2 Feb 2021 10:02:21 -0800 (PST)
Subject: Re: [PATCH 2/2] iommu: add Unisoc iommu basic driver
To: Joerg Roedel <joro@8bytes.org>
References: <20210202073258.559443-3-zhang.lyra@gmail.com>
 <20210202104257.736836-1-zhang.lyra@gmail.com>
 <20210202140101.GA32671@8bytes.org>
 <992fad43-c457-d809-3bd7-7fd5b6e8fa22@arm.com>
 <20210202144126.GC32671@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5e766b74-ab51-8c47-66c1-ca65bc5743cd@arm.com>
Date: Tue, 2 Feb 2021 18:02:15 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202144126.GC32671@8bytes.org>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-kernel@vger.kernel.org, Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Sheng Xu <sheng.xu@unisoc.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-02-02 14:41, Joerg Roedel wrote:
> On Tue, Feb 02, 2021 at 02:34:34PM +0000, Robin Murphy wrote:
>> Nope, I believe if Arm Ltd. had any involvement in this I'd know about it :)
> 
> Okay, got confused by thinking of ARM as the CPU architecture, not the
> company :)
> But given the intel/ and amd/ subdirectories refer to company names as
> well, the same is true for arm/.

Right, trying to group IOMMU drivers by supposed CPU architecture is 
already a demonstrable non-starter; does intel-iommu count as x86, or 
IA-64, or do you want two copies? :P

I somehow doubt anyone would license one of Arm's SMMUs to go in a 
RISC-V/MIPS/etc. based SoC, but in principle, they *could*. In fact it's 
precisely cases like this one - where silicon vendors come up with their 
own little scatter-gather unit to go with their own display controller 
etc. - that I imagine are most likely to get reused if the vendor 
decides to experiment with different CPUs to reach new market segments.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
