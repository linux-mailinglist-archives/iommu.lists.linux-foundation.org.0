Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DEB34B11B
	for <lists.iommu@lfdr.de>; Fri, 26 Mar 2021 22:13:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B0F60D62;
	Fri, 26 Mar 2021 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvg-oozNGtsL; Fri, 26 Mar 2021 21:13:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC71560645;
	Fri, 26 Mar 2021 21:13:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A9E2C000F;
	Fri, 26 Mar 2021 21:13:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8679DC000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 21:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 665A34060F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 21:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPDTbGjFVjG7 for <iommu@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 21:13:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE01040245
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 21:13:39 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 753b7a91;
 Fri, 26 Mar 2021 22:13:35 +0100 (CET)
Date: Fri, 26 Mar 2021 22:13:35 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <CAK8P3a1CFHgjuzmefKcbC3MPeBD0USeTe7oZsTcQ=6tagG3Cvw@mail.gmail.com>
 (message from Arnd Bergmann on Fri, 26 Mar 2021 21:03:32 +0100)
Subject: Re: [PATCH 0/3] Apple M1 DART IOMMU driver
References: <20210320151903.60759-1-sven@svenpeter.dev>
 <c1bcc0609e920bc6@bloch.sibelius.xs4all.nl>
 <20210323205346.GA1283560@robh.at.kernel.org>
 <43685c67-6d9c-4e72-b320-0462c2273bf0@www.fastmail.com>
 <CAK8P3a0fvnYLrG=cGiOQ6u8aZnriTeM0R=MW7FX=94mO13Rq0w@mail.gmail.com>
 <c1bcd90d344c2b68@bloch.sibelius.xs4all.nl>
 <9f06872d-f0ec-43c3-9b53-d144337100b3@www.fastmail.com>
 <CAK8P3a2b7k6JkxecW=yu-NF+fkNCxJ3Ja36nQ7LK8hsuO=4=sw@mail.gmail.com>
 <c1bcd9821a8f8c05@bloch.sibelius.xs4all.nl>
 <CAK8P3a1CFHgjuzmefKcbC3MPeBD0USeTe7oZsTcQ=6tagG3Cvw@mail.gmail.com>
Message-ID: <c1bcda5b25b1f37d@bloch.sibelius.xs4all.nl>
Cc: robh@kernel.org, sven@svenpeter.dev, devicetree@vger.kernel.org,
 will@kernel.org, marcan@marcan.st, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, maz@kernel.org,
 mohamed.mediouni@caramail.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, stan@corellium.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> From: Arnd Bergmann <arnd@kernel.org>
> Date: Fri, 26 Mar 2021 21:03:32 +0100
> 
> On Fri, Mar 26, 2021 at 6:28 PM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> 
> > I haven't figured out how the bypass stuff really works.  Corellium
> > added support for it in their codebase when they added support for
> > Thunderbolt, and some of the DARTs that seem to be related to
> > Thunderbolt do indeed have a "bypass" property.  But it is unclear to
> > me how the different puzzle pieces fit together for Thunderbolt.
> 
> As a general observation, bypass mode for Thunderbolt is what enabled
> the http://thunderclap.io/ attack. This is extremely useful for debugging
> a running kernel from another machine, but it's also something that
> should never be done in a production kernel.

No kidding!  I was surprised to see the bypass support on the
Thunderbolt-related nodes.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
