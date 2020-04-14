Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC651A8738
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 19:15:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1BB9D87E74;
	Tue, 14 Apr 2020 17:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXRn+Is4MsTU; Tue, 14 Apr 2020 17:15:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68B9087E68;
	Tue, 14 Apr 2020 17:15:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50FF4C0172;
	Tue, 14 Apr 2020 17:15:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58786C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 17:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3AE9E2152E
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 17:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RX8IKKmQmBe for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 17:15:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 7363821514
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 17:15:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D186C30E;
 Tue, 14 Apr 2020 10:15:38 -0700 (PDT)
Received: from [10.57.33.145] (unknown [10.57.33.145])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2BE93F6C4;
 Tue, 14 Apr 2020 10:15:37 -0700 (PDT)
Subject: Re: [PATCH] dt-bndings: iommu: renesas, ipmmu-vmsa: convert to
 json-schema
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, joro@8bytes.org,
 robh+dt@kernel.org
References: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fef59497-e5ef-bfe4-e845-389fd623783b@arm.com>
Date: Tue, 14 Apr 2020 18:15:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-GB
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-04-13 11:25 am, Yoshihiro Shimoda wrote:
[...]
> -Each bus master connected to an IPMMU must reference the IPMMU in its device
> -node with the following property:
> -
> -  - iommus: A reference to the IPMMU in two cells. The first cell is a phandle
> -    to the IPMMU and the second cell the number of the micro-TLB that the
> -    device is connected to.

This definition of what the phandle argument means...

[...]
> +  '#iommu-cells':
> +    const: 1
 > +

...deserves to be captured in a description here.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
