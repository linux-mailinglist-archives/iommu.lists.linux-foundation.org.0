Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB320CE8A
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 14:33:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8252D87604;
	Mon, 29 Jun 2020 12:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQWZ0wlUb_Dq; Mon, 29 Jun 2020 12:33:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C278E875FA;
	Mon, 29 Jun 2020 12:33:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6F18C016E;
	Mon, 29 Jun 2020 12:33:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61806C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 12:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4EDF98934C
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 12:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akWo63rPYvFc for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 12:33:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 28E838933F
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 12:33:30 +0000 (UTC)
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jpsyW-0006SZ-2C
 for iommu@lists.linux-foundation.org; Mon, 29 Jun 2020 12:33:28 +0000
Received: by mail-pg1-f197.google.com with SMTP id o34so12327783pgm.18
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 05:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6rSGUcxEtasmikuRjUacPJe3K2leqY94Ck1/E/gRXXI=;
 b=pgxH9zYY6BIedwrPYsmO5vO579UToMzffXk/zgQb6y5S2ADA1jShGYSEysQfkrGHgh
 jqYqXARIQ0fhbhgoa77Hfuv/ItpBjWZ9Ejz25YhigFk3oQpYUF/vTifuan+U8O8uczUA
 5+yelBu/v2cTjmSdFG2fbRntN6sR5jmNGndT4DofydDqhx2nc/56dZXdKxU5hBbLKCwD
 cnMqNhRMZJHrQU/NAmOkHnFOetbHkVi6jUJWD5SQa7CZ5uZhyKpnV2gI3lXYFv9hAvox
 fhT5AZbBA4SPsDuJFjdR0w8a8DQuqKXUgJHLATYN3c4b8/2M3l7W9Um8zMPYjwFTJZIW
 vrhQ==
X-Gm-Message-State: AOAM530v7++0N//QgH2NH3u/mZ0tw2JUkdBXuKKYajvtj32WlVhvCdxC
 GVs7ozyMoS2aqpWy2s6x99Mtu4rOH5e6+iwWbdtYcnmsGeavas5fjdmoSCJgEdK6OgVfJEtwXea
 rz8SaIPLb7XTTutOf1odIcrpvvcvHus9MTvv/JA/xjs5SEk4=
X-Received: by 2002:aa7:8b01:: with SMTP id f1mr14720683pfd.223.1593434006590; 
 Mon, 29 Jun 2020 05:33:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSfSEI9VTobq3zQg6b2gevJg3MoMRLSL2CpTKRfwrmyfWZi30iMQn8TPZ63aVpR46Cp+GCvg==
X-Received: by 2002:aa7:8b01:: with SMTP id f1mr14720649pfd.223.1593434006025; 
 Mon, 29 Jun 2020 05:33:26 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id bf11sm3556197pjb.48.2020.06.29.05.33.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 05:33:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [Regression] "iommu/amd: Relax locking in dma_ops path" makes tg3
 ethernet transmit queue timeout
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <8D375E06-A763-4B5E-9C6D-DA5EBC62530E@canonical.com>
Date: Mon, 29 Jun 2020 20:33:22 +0800
Message-Id: <CFC22DE4-E342-4F32-B758-6A690755C498@canonical.com>
References: <4E9B03FB-9DA5-4831-B4CE-A0AA645D3F22@canonical.com>
 <20200518133209.GM8135@suse.de>
 <381D21C9-C913-4C33-A6F4-0440B5D11670@canonical.com>
 <8D375E06-A763-4B5E-9C6D-DA5EBC62530E@canonical.com>
To: Joerg Roedel <jroedel@suse.de>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Cc: iommu@lists.linux-foundation.org, open list <linux-kernel@vger.kernel.org>
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


> On May 18, 2020, at 23:32, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> 
> 
>> On May 18, 2020, at 22:05, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>> 
>> 
>> 
>>> On May 18, 2020, at 21:32, Joerg Roedel <jroedel@suse.de> wrote:
>>> 
>>> On Mon, May 18, 2020 at 05:06:45PM +0800, Kai-Heng Feng wrote:
>>>> Particularly, as soon as the spinlock is removed, the issue can be reproduced.
>>>> Function domain_flush_complete() doesn't seem to affect the status.
>>>> 
>>>> However, the .map_page callback was removed by be62dbf554c5
>>>> ("iommu/amd: Convert AMD iommu driver to the dma-iommu api"), so
>>>> there's no easy revert for this issue.
>>>> 
>>>> This is still reproducible as of today's mainline kernel, v5.7-rc6.
>>> 
>>> Is there any error message from the IOMMU driver?
>>> 
>> 
>> As of mainline kernel, there's no error message from IOMMU driver.
>> There are some complains from v4.15-rc1:
>> https://pastebin.ubuntu.com/p/qn4TXkFxsc/
> 
> Just tested v5.7-rc6, the issue disappears as soon as kernel boots with "iommu=off".

I am still seeing the issue on v5.8-rc3. The issue goes away as soon as "iommu=off" is added.

Kai-Heng

> 
> Kai-Heng
> 
>> 
>> Kai-Heng
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
