Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D93F34C1AF6
	for <lists.iommu@lfdr.de>; Wed, 23 Feb 2022 19:32:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B7C9400BA;
	Wed, 23 Feb 2022 18:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id np_mauqoM4Ba; Wed, 23 Feb 2022 18:32:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A124040126;
	Wed, 23 Feb 2022 18:32:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 466CBC0073;
	Wed, 23 Feb 2022 18:32:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD281C0011
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 18:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEECA60FAD
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 18:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6e32Execs00f for <iommu@lists.linux-foundation.org>;
 Wed, 23 Feb 2022 18:32:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D975760FA7
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 18:32:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGJSn1VqDh7RwQqgY25jKtOrRfKmrn9HukPp5h4Jvk5tD0lY2hXavCgwW4JdvqdfDKgIUU0XuW6vZfyJKM6ndtz2HSFL9xyq8K2hc7R/N4E5tnSShsD46gt8TbuOEWD6W3rRQHfpwYC1LH6EHyitMLsDLEIVd9nX0F6c1YrzkY6Vr7Bj+8iFe5jVD9gDUCoD8bPEbcMZx+wHxIk0bAGmEC34KoURDMwNblVZQVuxVFhxy3IE4O9UAX9W9cVG09lmodDtOnmpE2LjpBkf1WPJqPbPHxAuXGoGe+2ticSX4b0yt7QG0R0qMxrPYjT/jv3S8SECKTFwYv+INOIk92nVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/8MmKkLoA6SLkiUnKcfjqSEhl4P2eY+NEiaK9FLbMk=;
 b=aLrrsZ7FPw88AgLomxiPIQ1wd2ope3F0edbEKOkiLRrkjB8AiACUrlzWHI0XWOU4zTY7qeFYNUck3S4mzqez5ks2MkG0j9VR5sUQvXhefrcihkJMKI1euBNBjEnYTnRrtbRXQUcIuAhzsTPky0qX6ubTvpWzfHFXJj+vXKuxOrn0L2joDJJ+VymSm5wevChS/wKJ4CHfJjnKfEZza8Av65nUhL42ZlY9Ey3NBPJ/Spxs60BqotR1i1XRqtQy4rt6WcROvRdCf8AeJKZtbwM5No9eoVI1aISdMPNy4GsHgsAyizZjfKfZQLBrvHeRnkWX2szW7kwK+Ldqr3Z79xdg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/8MmKkLoA6SLkiUnKcfjqSEhl4P2eY+NEiaK9FLbMk=;
 b=ClW8kUshS2cfbo2eIYiBnt4oglBs50EQguTsfd5+NFZSjkdhmwXxtKrQN0l04mQCHjbL0Sj56o7KQQLxVJOV4tqsNq2x9p4Blq7RsiN3t5ZtU8GNaX4sf5pQc1YBt1QY1PzGAHvIwhoIbDuxGlcT+/4eHb8FtBr+SqbL4Gctcc6OHHtxejeFWZU/V68o0jW/iTZ8LVcts2K1XcLYVJmL8YeB18y9djhB2sHJgfApjU594XNCyg42W/JvFDRltrtYl9fXYXaLTQIUyzZL6+B53epkwLqsY9dsjqN1RXdQhK9T4oMyWkk9lyoElTibe++HBY7F0FcLj/UhhgkO8hveXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1479.namprd12.prod.outlook.com (2603:10b6:910:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Wed, 23 Feb
 2022 18:32:50 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 18:32:49 +0000
Date: Wed, 23 Feb 2022 14:32:48 -0400
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v6 01/11] iommu: Add dma ownership management interfaces
Message-ID: <20220223183248.GC390403@nvidia.com>
References: <20220218005521.172832-1-baolu.lu@linux.intel.com>
 <20220218005521.172832-2-baolu.lu@linux.intel.com>
 <f830c268-daca-8e8f-a429-0c80496a7273@arm.com>
 <20220223180244.GA390403@nvidia.com>
 <2114e6e6-68cc-4552-8781-0a824de2c0de@arm.com>
Content-Disposition: inline
In-Reply-To: <2114e6e6-68cc-4552-8781-0a824de2c0de@arm.com>
X-ClientProxiedBy: BL0PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:207:3d::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0e18010-5793-46a0-3d23-08d9f6fae50b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1479:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1479C6F23E017B2E688DDA91C23C9@CY4PR12MB1479.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+Uzmx7OIhJkiROkvQQpBtawbgQiJcOtIi4jFcBKYXLUjvIhG3r/JgijbonmtFKCTQqBZYUTjbYfD0pDi1s0b0nqcw+mLUBPlUv3lasq6dLM5tU9AReQlJ1MZR8hLNv/eDHpnw5wzIxtGewqNsMw29exM+NQmD8D23D/aU30ABaC2XJ9UhCiz7CSUpgzG9bI5nALXTf1giVrs/pAMPsHUMcWGOEwMXPElW2K77xe6OJRCGf62H9MP26iUVO0jWM4Wll9ZzZFfZVuLG3eYOKfjM8oMtDFfyKhNW2Y+Qqh9tg9FtjXL3ksqfT4gEoDrQo8Az7Gtpy0RhIQ1WbTsVmG6QH5L+PrHIUiPDf9kdMo+hKcXmXN95WYPvC5iMnCjXzof+yqE2M8mCbeCE1FKoklFfLK0Vmutz9FNfjC/nsTzIYr5NlfivzOZgf2WrJlZD7CaC3uTI7ymG7pwRxha7D4WaZZZc5QrBVKsikNfjyvaA+4u/tMoPFYK8yDa+IeFwPkxp18MCXNEb+9eUf3hn2v0ZtpKVjsM93tgsEOhvYyhatnLusvFtoFdvClCe8HZLYg2FbNyrYQQUzU1Gi8yoA0YlGbYGxtg3uaNLX1OGTPeF4w7geo24pXBlFOFCO7l9wpyeIeDY+goUkqoGEyJ6ieEbhiTJGoGnkKx2Qnq1S8xpwLdHTsJFA31FKnOoG4BAE5ZA0H9wJY9xtqW09tZb8KCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(6916009)(8676002)(508600001)(66946007)(66556008)(6512007)(316002)(6486002)(86362001)(53546011)(54906003)(2616005)(1076003)(6506007)(66476007)(4744005)(36756003)(4326008)(38100700002)(5660300002)(33656002)(2906002)(8936002)(7416002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ft3tZbVeUv7DeG+U/Bld6XHW/+qG1Sfo3EguZpTubmZCC6zgFa2XEu510Bg+?=
 =?us-ascii?Q?J80/WO+3buclJKLWvTnHl50xZcrXM1yxYNS6LeU5ndafqHFqJF2a4qEbHqdF?=
 =?us-ascii?Q?zxfNxUPKXHl5bkIks1icXHm0ltMRlpBNNvpU3gDYIl9R5JV+Xxn6lcyoFUtS?=
 =?us-ascii?Q?lqqjsfji0KNXLS+YXtXOA5wXShHMhvPzvUn6ybmX/lli4+XYF/mBxNRFZTtG?=
 =?us-ascii?Q?pb/EEq5BRE3ADZtM9jIFcqHMt0yLC2M70hweH+V3TcqbpTY8DKJa0s5d4+l7?=
 =?us-ascii?Q?gV3DaSMUbtVGAl2sfy0iA5wb87XaaihjYH2id28+F+f1KnobeYwxF0fQ5fJJ?=
 =?us-ascii?Q?y5b3/P/DvScAlhzcSB//Ij6qu9jWL6eUNM+P7U7on53z0qZBWBLa+yxjn346?=
 =?us-ascii?Q?PY9yADEBmbil17WHiujXF7hcNNO9iSKvqRQS1+hcpzXg4736XgSY9Kz+NMhs?=
 =?us-ascii?Q?vYfCSxaOHfbfuPZrkKgTmYHOs5el30FVkrfEIsbMOW0obusEv9pKINbNxbRf?=
 =?us-ascii?Q?KiBgdlKFPuQIcDkFvS3EOJlxhsUPul6LDyavObXRBz3srqKZJK2hT6nPcL5S?=
 =?us-ascii?Q?SRFhla6zeHmZg8AZCKWd8FRpR0Rr0PX8sQWybQq0u0DPstHHLB+C8uWYmyIC?=
 =?us-ascii?Q?Sv92QjP/jSBUMwPDMc+q6bT6yDQiKJfYqJYNFYyNNun+RmfUtQ+KZ2o/+JLt?=
 =?us-ascii?Q?3T6CWUC8O+WlcG7AwoV4J72y1oP+CdkPrdX8KebzKCYDKs8pod7oa+LebCfl?=
 =?us-ascii?Q?xPr6F+YUtt1T+YI3elmjE/AZrbcHnw7Mz+Ni+OlPn280kj3m6Qvcu6Wy0gLu?=
 =?us-ascii?Q?0FUA1boM2IOEVdndwI8syydYtyg1Fw8FOcMxVGuLoPq/L4WCrTJw1jeAu+5a?=
 =?us-ascii?Q?hYjN75Z0h3XF8tamS88yLphxYiMqiKQXWS7cHXnAf3zCWRFkVGsdb8AFujFs?=
 =?us-ascii?Q?ZXXhY3e3QLDxRHp1JdqHKqXlOPICvrinmIZvH1d7aAFYpUk0G7gy5cBTh4e8?=
 =?us-ascii?Q?uHU9oQD26OttYhhERyzK+M642oX3ZSf4Sj1moZXrPaZocHplne6k7v4venkB?=
 =?us-ascii?Q?TtTcd9ksDnrf/uNs9f6Q9z/IGwnYlz6uV4L6t7ue+h5Y/CJoQKFfuoLxR5WW?=
 =?us-ascii?Q?I/0IFbC+K83rv+a63e6qXBGDN1PuP3rU07U5IChmYq8pGXHZxdlVx0YQZeEM?=
 =?us-ascii?Q?RKGdFbhpxCwDAgv/YdDjyGraZnmiZTN8SiwUOfxWiNPrx/0UsgDznQKuXtWR?=
 =?us-ascii?Q?rn2JzNhSRp0ugGH99vkHc9cxZqliPcrpzt5DvX/7FH8xszc6JideIJBoaQvN?=
 =?us-ascii?Q?jjhbL2+CefvcVTo/4e4dkQwEKomvM9hvTmnSOHoieH7kPpeiV6HOGQ6u5yj/?=
 =?us-ascii?Q?HHLKK1ok5TMlWCNCXuSstKHa7jSJm+hOP/1YpcxCa1VMUvPah+w6pY5dIhrK?=
 =?us-ascii?Q?asCELBqh56LfBYL8fPxCPX4fUo1T42ObK14+JCTvppyao9qw2oalAEM0bJt2?=
 =?us-ascii?Q?pj7yV0HljmYGVsSkJ+9e0Uu1uCkIArAYAIsBWupFpi6E/xoWkQZKxBXIxnWz?=
 =?us-ascii?Q?slhXdUKatuBa+BUXcGU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e18010-5793-46a0-3d23-08d9f6fae50b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:32:49.6330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NWNQNytKqbcqGBlHowJ7lbhp63ub/Oltj4y6XSzD7s1OsBavFPbeLUwoRVk6xQU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1479
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>
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
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Feb 23, 2022 at 06:20:36PM +0000, Robin Murphy wrote:
> On 2022-02-23 18:02, Jason Gunthorpe via iommu wrote:
> > On Wed, Feb 23, 2022 at 06:00:06PM +0000, Robin Murphy wrote:
> > 
> > > ...and equivalently just set owner_cnt directly to 0 here. I don't see a
> > > realistic use-case for any driver to claim the same group more than once,
> > > and allowing it in the API just feels like opening up various potential
> > > corners for things to get out of sync.
> > 
> > I am Ok if we toss it out to get this merged, as there is no in-kernel
> > user right now.
> > 
> > Something will have to come back for iommufd, but we can look at what
> > is best suited then.
> 
> If iommufd plans to be too dumb to keep track of whether it already owns a
> given group or not, I can't see it dealing with attaching that group to a
> single domain no more than once, either ;)

Indeed, this is why I'd like to use the device API :)

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
