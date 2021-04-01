Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5977A351721
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 19:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEEF6405A1;
	Thu,  1 Apr 2021 17:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJpgqdfh6BiN; Thu,  1 Apr 2021 17:15:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05200405A8;
	Thu,  1 Apr 2021 17:15:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3DD3C000A;
	Thu,  1 Apr 2021 17:15:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64879C000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5277060BE5
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Psk2uaqaNwr for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 17:15:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4E9760BE8
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:15:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D9EF613BC;
 Thu,  1 Apr 2021 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617297309;
 bh=Ph9+lnZtIzSHhSU0K6hxMEjAX5FATLhumPexdh/21YE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ri+XLAtbo6oc/14qf6Nc6kPi+TD8uNByUFcX9gAWNIrqfgTCdfJl62m0qAureFoaL
 vQsb20+HbosVH32lv0CWBjvCmH+4LFWlfr/Ew1I7yi4nqfA5VH+jLvv7MdhXQUc7TN
 n8QrOpYaXLw/Y5MbKHhSF+31FYlygg8xNhSz48Hycir/Pzebgu2afUkQdg2iq/nJe6
 92SaK/Y1oz8iCxjc6OS3EftTfhpde626t0I0Y/u22Wv4aOevCEyP7JrGivO7Xq/X55
 OtqVoeUtTnYozo22/PNi9ALkon1ZN/S+BWzGPLe3cPH7ldlB23iV6KBzmLPiZMsGb3
 /I/HrkcR1fqIQ==
Date: Thu, 1 Apr 2021 18:15:02 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v14 00/10] iommu: I/O page faults for SMMUv3
Message-ID: <20210401171501.GC9447@willie-the-truck>
References: <20210401154718.307519-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401154718.307519-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: vivek.gautam@arm.com, guohanjun@huawei.com, linux-acpi@vger.kernel.org,
 zhangfei.gao@linaro.org, lenb@kernel.org, devicetree@vger.kernel.org,
 kevin.tian@intel.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 rjw@rjwysocki.net, iommu@lists.linux-foundation.org, sudeep.holla@arm.com,
 robin.murphy@arm.com, linux-accelerators@lists.ozlabs.org
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

On Thu, Apr 01, 2021 at 05:47:09PM +0200, Jean-Philippe Brucker wrote:
> Add stall support to the SMMUv3 driver, along with a common I/O Page
> Fault handler.
> 
> Since [v13] I added review and ack tags (Thanks!), and a lockdep_assert.
> It would be good to have all of it in v5.13, since patch 10 introduces
> the first user for the IOPF interface from patch 6.  But if that's not
> possible, please pick patches 1-6 so the Vt-d driver can start using
> them.

Patches 1-7 look good to me, but I'm not convinced about the utility of
stalling faults so I'd prefer the later patches to come along with a
real user.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
