Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28C105753
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 17:44:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EDE6E21548;
	Thu, 21 Nov 2019 16:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FcKTUmenlx5; Thu, 21 Nov 2019 16:44:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4F47824E7D;
	Thu, 21 Nov 2019 16:44:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 395A5C18DA;
	Thu, 21 Nov 2019 16:44:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECC35C18DA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 16:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DACD581DE9
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 16:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ew9tUHkbYJPt for <iommu@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:44:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id B0E6386FEA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 16:44:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4E21328;
 Thu, 21 Nov 2019 08:44:23 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D1ED3F52E;
 Thu, 21 Nov 2019 08:44:22 -0800 (PST)
Subject: Re: generic DMA bypass flag
To: Christoph Hellwig <hch@lst.de>, Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20191113133731.20870-1-hch@lst.de>
 <d27b7b29-df78-4904-8002-b697da5cb013@arm.com>
 <20191114074105.GC26546@lst.de>
 <9c8f4d7b-43e0-a336-5d93-88aef8aae716@arm.com> <20191116062258.GA8913@lst.de>
 <f2335431-8cd4-e1ab-013d-573d163f4067@arm.com>
 <20191121073450.GC24024@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fb438be4-edae-8ca3-2eee-ec452f762cd9@arm.com>
Date: Thu, 21 Nov 2019 16:44:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121073450.GC24024@lst.de>
Content-Language: en-GB
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 21/11/2019 7:34 am, Christoph Hellwig wrote:
> Robin, does this mean you ACK this series for the powerpc use case?

Yeah, I think we've nailed down sufficient justification now for having 
a generalised flag, so at that point it makes every bit of sense to 
convert PPC's private equivalent.

Robin.

> Alexey and other ppc folks: can you take a look?
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
