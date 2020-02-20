Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC51664C3
	for <lists.iommu@lfdr.de>; Thu, 20 Feb 2020 18:27:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A5F187D56;
	Thu, 20 Feb 2020 17:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yfcsCDh1HYL; Thu, 20 Feb 2020 17:27:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F2F3F857DC;
	Thu, 20 Feb 2020 17:27:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA018C013E;
	Thu, 20 Feb 2020 17:27:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8929DC013E
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 17:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7220F82087
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 17:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spG-FxWqt0bo for <iommu@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 17:06:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A5E7E81F6B
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582218408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3M6kLg4BjF+DuWA5DcTOS8t/8X/cJ0Opg0BqCTy4sKU=;
 b=MBE6H7N6KAOUpDWGX3mzGHWn9ntHPYysErKiju0w1LpyWMl24rrXNppZVJHe7lhqAkDBbA
 4r2ajqMbxV3US10zQ8LjCa5Wusg+ATN7uPap33nUJgVOXgSi8kSMn1h9mVTRlLoaef0Uor
 VMJ+38u7lomJuWlEoJqS6ZEUagWgLtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-Y7n3AiXIOXK816aJw8_wdQ-1; Thu, 20 Feb 2020 12:06:46 -0500
X-MC-Unique: Y7n3AiXIOXK816aJw8_wdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44F09100550E;
 Thu, 20 Feb 2020 17:06:42 +0000 (UTC)
Received: from redhatnow.users.ipa.redhat.com (ovpn-117-1.phx2.redhat.com
 [10.3.117.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2E0419756;
 Thu, 20 Feb 2020 17:06:32 +0000 (UTC)
Subject: Re: [RFC PATCH 04/11] cpufreq: Remove Calxeda driver
To: Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org,
 Andre Przywara <andre.przywara@arm.com>,
 Robert Richter <rrichter@marvell.com>, Jon Loeliger <jdl@jdl.com>,
 Alexander Graf <graf@amazon.com>, Matthias Brugger <mbrugger@suse.com>
References: <20200218171321.30990-1-robh@kernel.org>
 <20200218171321.30990-5-robh@kernel.org>
From: Mark Langsdorf <mlangsdo@redhat.com>
Message-ID: <16a38b0d-8609-653a-64e8-3a0d4f4b1a45@redhat.com>
Date: Thu, 20 Feb 2020 11:06:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218171321.30990-5-robh@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mailman-Approved-At: Thu, 20 Feb 2020 17:27:11 +0000
Cc: kvm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-ide@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Tony Luck <tony.luck@intel.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 iommu@lists.linux-foundation.org, James Morse <james.morse@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
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

On 2/18/20 11:13 AM, Rob Herring wrote:
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Mark Langsdorf <mark.langsdorf@gmail.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
