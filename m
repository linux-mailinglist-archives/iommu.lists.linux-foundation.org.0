Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF6C40B31E
	for <lists.iommu@lfdr.de>; Tue, 14 Sep 2021 17:30:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E26380BA3;
	Tue, 14 Sep 2021 15:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3UnZNWeR49Qu; Tue, 14 Sep 2021 15:30:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AA3E280CE4;
	Tue, 14 Sep 2021 15:30:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77278C001E;
	Tue, 14 Sep 2021 15:30:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D387FC000D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 15:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACB4040236
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 15:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWPBPUNEJzLH for <iommu@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 15:30:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24CB1401E6
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1631633424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhWzPqc+baNtksScInoyMTGZMgEM+jvg4iBfu2+k9DA=;
 b=XajHjO5d4u0l7CSQfH3mYi4ZYJt37zy2Atm0dJ9bF5SjkiudVRUMm30+e6von0E7l6S5dU
 ms5GJde6o2fzB4HsxO50gw9G26+Ny8XTlE3Hw4GF+jgG3AcG2C11mCXdyye3fiBJoFSIjg
 SMaLN5p4Ic5oNncRW1qu0n8z9ppcACo=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-G5eDJQa8NLqkuyWUKAJ4qg-2; Tue, 14 Sep 2021 17:29:12 +0200
X-MC-Unique: G5eDJQa8NLqkuyWUKAJ4qg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBAA5TupC446mVSVjKo9V+J/Iu2eC6Fb9hV9F7LdCa/pTPM1LXOq3n7wdIh/W6iKArAJegcUaGTVUFwXKmlJ1vAwO0ulUp3u4AzA/3JfCtTv+Ns/q2J9H8P00HOrWojtu0LTVrPPEL3GcP+ydQJkVcAfW581SvJTdg3hjIuTrQ9fQi/vQO4E0OZHSdIG1piC015SXDF5HOPlUeGDSnOOKuel1gmHgL7wLhKNtepAwlTKj6ibcWaO9FQCrkhzIJf1fOl+2viAxrwkkz99Utk4vL9DqEkuPtp/3Wn7ACyxbTI5IAeRSUg2d51XUSqA4XocQ7nbc627yErH0R91ZFTk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hhWzPqc+baNtksScInoyMTGZMgEM+jvg4iBfu2+k9DA=;
 b=QJXBGHRJoxVYSgQKR75ZqtQBu2JWN2ijj7/zhZhbrHSbInJOTW8wp8HgnVgJZ3os0DY5EQ++b4XgpKsUB8vWoVhMwmQfPHOwb++lBH7KPqcomUWK+bjJykWjWLv3+l9078TL25bjJ+A/ESIDB4hidja/xztszSGjyCDorde6oWh7RAx9/o9A/lVCp5P/oPvUAXAAnUPTIus96qxT2LrYnwQZjnb6/VxOT2kZFZnYUdAwuxWeyywkE8RD6/Xnkt44oi6zYOISTow27UQIayqgcn1bGRXoO18PfL2CxfaC/wadWMOJBx2MnnqdJ8VrrbewgTRVlPpriMLqeMUHyzs3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=none action=none
 header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Tue, 14 Sep
 2021 15:29:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 15:29:10 +0000
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To: Roman Skakun <rm.skakun@gmail.com>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
Message-ID: <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
Date: Tue, 14 Sep 2021 17:29:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210914151016.3174924-1-Roman_Skakun@epam.com>
Content-Language: en-US
X-ClientProxiedBy: PR3P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0051.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 15:29:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 074dfc55-95fb-49c7-e925-08d977946657
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2334A539B4FCAEFF4E2FA551B3DA9@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RYoU3P+Y0RnTn+IGj2fzDOBGc0v8jOjAO4pN2pmc16lKx818yevzS30dMvhdz8ceOWjTOkEM2fwnNDUASKTZayhy9rTCD6v1kleeE95zvxxPwyMpZh1lfXPQ3JKpsnonX5LNEh3Vu1fbmXdFeqqKzz25vgPzSSbLV/OwqEQknaLDrzwnfTgeznDqJWjxlsVcC9sYHoDrLtB49Fvsh6IlCpGm8/wpByf/wdbjoTMl9Pt+dRkWZugoeRByDq0FzpAimYt+VNZPTzTqOVlw8On5eQ3VpG/OSAk4ObykCcm8oUPoV4SzRiyhIfLq9/DBSQuXKAaHQd1wPwq97F68XgxDHeVH/PSatmhRN8/zckvBgT1UYVfP5jSY+my4czYnYpTWo6CblQ9i/fB/cSMhISvjqOC6hmc+3k0UNmIGSEQtdhhh+HTFaiKuXSYOwOQ4cRE06uiboKxXkhyKGbpdhRcoNKsQ+HTDZcTGkgoaVFampZVCZRNALVZqsKyZwoVX7qnJasU0zOUq5sEAyOPU0L+WsdKd5UniZpYJQuStlHxc8ljXn64I8NDE5XHFvJwXo4d1KeKcB76a/WB8j8+PuBbjjxFwSOSnW2HnDzuxjHdSjzNTl2IjkMcsMKSTv4PT4BEpED6FeRw0QTmFwVZHmyvw+2GLuz4rdzFWqyrzzf+pGwLNmzz6/02MjNVBc0sZJMVKLIgzSuLM4PKzYwoda1zxRzGztL+b4kMyNTKFStZFPzGStXTgpwAuWdUTGqW5YCw00LM+SoDKifedQtHjkZnHZyVI8YPbDerPxyC8d4Dv4deopMYuAlO12AuSlGEIRTCc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(396003)(136003)(376002)(6916009)(86362001)(66946007)(966005)(16576012)(38100700002)(186003)(316002)(5660300002)(6486002)(83380400001)(7406005)(7416002)(478600001)(54906003)(66476007)(66556008)(4326008)(31696002)(2616005)(53546011)(36756003)(956004)(2906002)(8676002)(31686004)(26005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXpaZmNvUjZVNWNjVGhZcVJFZzJqR25PcGR4bjgvcmFQMDZ4a1pCdFZVNDN1?=
 =?utf-8?B?d0dlenhXMXp4cVpaT283UGNtc0NPZXpHY05SRmtxc2RTZ3B5NElLaGhocXVL?=
 =?utf-8?B?SWszUmY5MDZaNlNtajljYmZMMU1MWDl4UnZwSHk1QUEvbXBBa1Q2cWtHRDBL?=
 =?utf-8?B?TjdFUEVpNThPVFNxMkc1ZVk0NHpFcDNYdTY3Y2pOSkNUWmJNQWkvNStld2V6?=
 =?utf-8?B?R3J1YmFDaWtvZVVVc2ZXakJRYXlFUjZGSU1MYmdaQXZjTDJ1NS9Ra3ZGelNa?=
 =?utf-8?B?TW5WR2JIR0Q0ZUgxaXRHaWcvaytsRUpVQUk4SFl0Vnl4QjQxQUk1VGhBZGg2?=
 =?utf-8?B?ZW54dmJCMGtVOWdpUVNDdUg1eXNsMEZNY0N3S1Z2Rko0RWcxdnhKY0lnOU5L?=
 =?utf-8?B?WXA3a1ZTdUhNQUFHNmpjMFZiMUhsUjZtVzN2L0ZzOGR3VzBEaXU1NHJnTWo3?=
 =?utf-8?B?aGJxbFMvN2dFVXl2T2tQRXpHUUY0K3JFby9JUzBnM3dvRkgza2YzSS9vTUtI?=
 =?utf-8?B?WjhSQ2Z1aHBGREJHekRucm1lUFVuMWEzY0NYdFdJNVE0alg1YjhDRXRFWHBx?=
 =?utf-8?B?UW4yTHk4QnVFKzNjOUE0eFZLQ29TYkNMSHdHekpzSFdPNWw5cXBMYjdwK3F1?=
 =?utf-8?B?dG8rdjlrUm51RDBnUGV2a3QyQUFoWHRyWFdQUHdGYVRyZ09rZTJkSHVVT2RQ?=
 =?utf-8?B?K1Fuc0FBTFprMUJXTzhpbktDLzNNeWkzVDkzV0NaTFNDTTd2THMwZ3BTcFZh?=
 =?utf-8?B?TVVYL25rMVFyTFdzSDVJOU1PVWRxTHJ1OUQyaTQ2dVNSNVBHd1RPMm50OUpR?=
 =?utf-8?B?WDcxNWhKbHRDREgzdHNzbGlESkZsNU5ZU2VDandSQ2o0OGlOWG54K3pDZ1Jr?=
 =?utf-8?B?Wm5qc3d6Q05oY0pUVlo5bm05azROL3lDNWRKckIxdUM1TmtWYzVMakF3NVVo?=
 =?utf-8?B?d2dteUN5Skt1N09KSndoZG9vRW5oUVE2blgrSmFuYTIvc3ZVQ3AwRytYa0Jh?=
 =?utf-8?B?aU1tVmRsMEdxN0NsL0ZJai9UNHBwU0hHTTJ0STZWaFlWV2RmZGZ0SmtpYkdh?=
 =?utf-8?B?TXYyOTJwdnVJVXI1RUN5OEdIT0E5Vk1iZTZab3pJaTUxR0JaN2tSNlM0MjN3?=
 =?utf-8?B?cEdEWmlCSWk2cXlGNVV4eFlGNHhYdThpV1BXWW9pRzh5cTRhUEI4M1pYVU9x?=
 =?utf-8?B?REFJSUlva05mTERKRkw3d0Y4QTZQS2hQSFdkUkRBQXJZcG95T2Q0VkhzL1dJ?=
 =?utf-8?B?NmxzRjA0VGcrU3Y5VDVKSjA1UFBQNHdBYXF5SUNrdzBiZ2F1cGQrODR5ZnRK?=
 =?utf-8?B?ZW80K0J0aFh4ODBCU0VkbXZqeXlhQW1WcndSRW53UVlZaUduWFJrSWhwcmJN?=
 =?utf-8?B?Q21XcDk0Um5lNTVHdnpKeXdjcU4wV3Q3YjhyL3JyZ2NFdUdLbUZBOEpBTG1I?=
 =?utf-8?B?bC9LcmZEblJwYlBQd2hBS2Fza0pRSHVlSkN1THdoSFJKUXBDa28yR0s5dXpr?=
 =?utf-8?B?V0FmWDhtZ2s1aHJxSFVsUTJRWUg4aktIV282MU0xeWhKL2tFV3h5V1JUNXVx?=
 =?utf-8?B?SUNSaEdVdFIvTTkra1pxSld4VFAxZ05XMklTTU1wSGhPSWM3c3hCdkJXVjlr?=
 =?utf-8?B?UzhOdXJwSTdhNkxCYlBHVi9vV3dpUis5dFpOd2VreFlJK3N0L241OHFkMEx1?=
 =?utf-8?B?QWpZODJpUFBXLzRHZEZUeHJpdXh5bUgva3JZS25HV3hMdmszelQ2VVRjbThp?=
 =?utf-8?Q?EHtteRfnHGiG4VVIJeSMsg07Np7Q1JnvbOEPUBb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074dfc55-95fb-49c7-e925-08d977946657
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 15:29:10.7377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXdQssFPz9rIrTB1YSXP35DiSNUdVE4BfSOJKHu3+j7Ku5TB+6FgftUS2/Mi3A3sAouc4CUWJBS2Nck1t6XQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 xen-devel@lists.xenproject.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrii Anisov <andrii_anisov@epam.com>, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Roman Skakun <roman_skakun@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>
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
From: Jan Beulich via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 14.09.2021 17:10, Roman Skakun wrote:
> From: Roman Skakun <roman_skakun@epam.com>
> 
> It is possible when default IO TLB size is not
> enough to fit a long buffers as described here [1].
> 
> This patch makes a way to set this parameter
> using cmdline instead of recompiling a kernel.
> 
> [1] https://www.xilinx.com/support/answers/72694.html

I'm not convinced the swiotlb use describe there falls under "intended
use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside,
the bottom of this page is also confusing, as following "Then we can
confirm the modified swiotlb size in the boot log:" there is a log
fragment showing the same original size of 64Mb.

> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -237,7 +237,7 @@ void __init plat_swiotlb_setup(void)
>  		swiotlbsize = 64 * (1<<20);
>  #endif
>  	swiotlb_nslabs = swiotlbsize >> IO_TLB_SHIFT;
> -	swiotlb_nslabs = ALIGN(swiotlb_nslabs, IO_TLB_SEGSIZE);
> +	swiotlb_nslabs = ALIGN(swiotlb_nslabs, swiotlb_io_seg_size());

In order to be sure to catch all uses like this one (including ones
which make it upstream in parallel to yours), I think you will want
to rename the original IO_TLB_SEGSIZE to e.g. IO_TLB_DEFAULT_SEGSIZE.

> @@ -81,15 +86,30 @@ static unsigned int max_segment;
>  static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
>  
>  static int __init
> -setup_io_tlb_npages(char *str)
> +setup_io_tlb_params(char *str)
>  {
> +	unsigned long tmp;
> +
>  	if (isdigit(*str)) {
> -		/* avoid tail segment of size < IO_TLB_SEGSIZE */
> -		default_nslabs =
> -			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
> +		default_nslabs = simple_strtoul(str, &str, 0);
>  	}
>  	if (*str == ',')
>  		++str;
> +
> +	/* get max IO TLB segment size */
> +	if (isdigit(*str)) {
> +		tmp = simple_strtoul(str, &str, 0);
> +		if (tmp)
> +			io_tlb_seg_size = ALIGN(tmp, IO_TLB_SEGSIZE);

From all I can tell io_tlb_seg_size wants to be a power of 2. Merely
aligning to a multiple of IO_TLB_SEGSIZE isn't going to be enough.

Jan

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
