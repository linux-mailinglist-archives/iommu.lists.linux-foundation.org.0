Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E3489373884
	for <lists.iommu@lfdr.de>; Wed,  5 May 2021 12:24:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA08405B9;
	Wed,  5 May 2021 10:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5fCrlFOO2QI; Wed,  5 May 2021 10:24:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F15140581;
	Wed,  5 May 2021 10:24:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 133CEC0001;
	Wed,  5 May 2021 10:24:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B668C0001
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 10:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C81C40299
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 10:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CclUpNX7QSTD for <iommu@lists.linux-foundation.org>;
 Wed,  5 May 2021 10:24:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05olkn2061.outbound.protection.outlook.com [40.92.89.61])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8478B401CC
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 10:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRrnTleIikd159Vps3ignAGDoxvyb/KhJm/DE4FnQBNwfkkjh13tgZFAHHAHWlZhKZA8C3+x9/802Rlb8KCL0SlTCaYtk37aTm/Zll4MvYh6odfhu3WICTqjsSLDYLcnB/unA1jSZ8SGrZK+jXHyAtkHfUUt8aH2VM6VSmKK7hjGRTUh+KGXLBxmjuXMSkhACTE3Xm6THVr+Nswv0DGsORYrjLQ+mx9PS4hYf5DCdiLbe2DAuthbRX9Rd9SZVTMPKktU9KI3/doN8O2LIe0zBI6hKGomLurejaMANx+1D9/UbsCup5eEhXyXuA7Dtl+2t8I9v7aQzP5x3MLsBeYkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJxal/I82YEHUsPiZ4N/zcBXcIDnH8o7zxeY+I4EIv8=;
 b=XqZ6p3yJAxw9/5GA239oX5xdk/08RVWDqCIORb9yRBkCKXkJaD9XUBGpdrTYTcpPe43rcWZ3S8ggds38Iw2+khUWGG5em/yy1RKfKfp3OO1qUmr16W2FjyEmIPN0mmId4rpa41gWNljnOJJYBnxgtAmCMrds3yfG5NFFymAdA6gtzMXhtd6/FCPgdOQA+2cOMJ+tanc73zN3XnJlYM/YVBikuHQM4ef/RjKD1DyshH0KF7LyavU/IGkH0QZeoieAn1xlIQFYTRHiMHOcPEugUR4xKH9mw1vLOjSYQARHnIPNfn1mCCz3tbUsNJwUJRf/lvW95kvwQ/2Xqs5ppadRMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VI1EUR05FT026.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::51) by
 VI1EUR05HT102.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::100)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27; Wed, 5 May
 2021 10:24:38 +0000
Received: from VI1PR09MB2638.eurprd09.prod.outlook.com
 (2a01:111:e400:fc12::43) by VI1EUR05FT026.mail.protection.outlook.com
 (2a01:111:e400:fc12::175) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 5 May 2021 10:24:38 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BAB6BFFCAAE460C1EE0FD966D77287A495829F440E411E8C645E032C861A5CB4;
 UpperCasedChecksum:94CC6709E6C45DA1520E427D8938459DA01BEC556173663949FE737565F3EAB4;
 SizeAsReceived:8933; Count:48
Received: from VI1PR09MB2638.eurprd09.prod.outlook.com
 ([fe80::948b:987c:566b:198e]) by VI1PR09MB2638.eurprd09.prod.outlook.com
 ([fe80::948b:987c:566b:198e%5]) with mapi id 15.20.4087.044; Wed, 5 May 2021
 10:24:38 +0000
Subject: Re: [PATCH] x86/events/amd/iommu: Fix invalid Perf result due to
 IOMMU PMC power-gating
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 iommu@lists.linux-foundation.org
References: <20210504065236.4415-1-suravee.suthikulpanit@amd.com>
From: David Coe <david.coe@live.co.uk>
Message-ID: <VI1PR09MB2638BB0FCE2E312B3471BC7FC7599@VI1PR09MB2638.eurprd09.prod.outlook.com>
Date: Wed, 5 May 2021 11:24:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210504065236.4415-1-suravee.suthikulpanit@amd.com>
Content-Language: en-GB
X-TMN: [1iV9f5vNuyVtcVzve2HaL8LVwxHRlOOc]
X-ClientProxiedBy: LO4P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::23) To VI1PR09MB2638.eurprd09.prod.outlook.com
 (2603:10a6:803:7b::27)
X-Microsoft-Original-Message-ID: <ed3237f2-e682-5f08-8c94-3c14a462c42e@live.co.uk>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.6] (90.246.218.100) by
 LO4P123CA0072.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:153::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 10:24:37 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e2625db7-4d68-41ba-9abc-08d90faffc74
X-MS-TrafficTypeDiagnostic: VI1EUR05HT102:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CAaOuzW05Ck8IUJoBfmldTL3PFAOiwEt8MO1Bm+vMTmanCuvde7hRabnCmH8qF/l1t1641OnU3rfhReckwsftQgJgU+fCogiTzyTqI8xPHSxQ1OMIAmOZzHUwErxgfaHDdrgkUJ1hAa9alHmp7xVJszKRZXHBiQxXmizk4aB+9/Xsjp0e05BDB+uanrBP+IyRbDWIDuPTEiITvKgcfptxfRo7zWe8XZ+S0ZdlmSnIXkg9pmzwaaPFhLhPE4pWucmAz8MKJrD9XEH2Jve28A4kp+ingxkBqo6HMDgJq3NrE00TZA8kTYr/gCfeOV2t4E+W3tCQah9gT208p7XTQBd1OIYO4W1Q4N9u1/A0Kt51ZjReQt5IUK3iwgkJn/dFpBEOHWO1fnBK2YHnDUa4csgcQ==
X-MS-Exchange-AntiSpam-MessageData: h3ASWrdWl/LKUIJAHEj1d+v2LH+1iICfyXK8a/ZcdGeTDmFSAgK4XsEucNZtKZ9zbx7Cs9cfWYmihPMBE+5BbzMtXF1WcJlktDqkh4zumqtqK5VCDc45G6MKTTH5Qb5ORfoaz1iSWFaHQOHRhneraQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2625db7-4d68-41ba-9abc-08d90faffc74
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 10:24:38.1358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT026.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT102
Cc: peterz@infradead.org, mingo@redhat.com, amonakov@ispras.ru,
 Jon.Grimm@amd.com
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

Hi, once more!

On 04/05/2021 07:52, Suravee Suthikulpanit wrote:
> On certain AMD platforms, when the IOMMU performance counter source
> (csource) field is zero, power-gating for the counter is enabled, which
> prevents write access and returns zero for read access.
> 
> This can cause invalid perf result especially when event multiplexing
> is needed (i.e. more number of events than available counters) since
> the current logic keeps track of the previously read counter value,
> and subsequently re-program the counter to continue counting the event.
> With power-gating enabled, we cannot gurantee successful re-programming
> of the counter.
> 
> Workaround this issue by :
> 
> 1. Modifying the ordering of setting/reading counters and enabing/
>     disabling csources to only access the counter when the csource
>     is set to non-zero.
> 
> 2. Since AMD IOMMU PMU does not support interrupt mode, the logic
>     can be simplified to always start counting with value zero,
>     and accumulate the counter value when stopping without the need
>     to keep track and reprogram the counter with the previously read
>     counter value.
> 
> This has been tested on systems with and without power-gating.
> 

Just as a final, sanity check I've loaded the same patched kernel 
5.11.0-16 on to an old AMD Athlon FX8350. So far, all seems in order: it 
loads IOMMUv1 and runs Ubuntu 21.04 without incident!

Much appreciate all your efforts, Suravee, Alex et al. Best regards.

-- 
David
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
