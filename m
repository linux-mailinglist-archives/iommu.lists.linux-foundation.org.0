Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D94DDAD2
	for <lists.iommu@lfdr.de>; Fri, 18 Mar 2022 14:47:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C1EA4090A;
	Fri, 18 Mar 2022 13:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhEMxbQSzwVg; Fri, 18 Mar 2022 13:47:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C98F24098B;
	Fri, 18 Mar 2022 13:47:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D70EC0012;
	Fri, 18 Mar 2022 13:47:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC671C0073
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 13:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B369A84845
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 13:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XC-K9SkUCxLQ for <iommu@lists.linux-foundation.org>;
 Fri, 18 Mar 2022 13:47:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04066847D7
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 13:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRO/FKW2vxI2qIYa1gBK6XJZ+e4Q/bB75wL1cbusKRqQhwIrFBvuIbd+8XE+MCeGaanBku1Y2dCfq8OIn1dZ9GRu3fQybDRENz6sWM1NLECLvcjudT7IOIrtfxtWBGcbY7jICJQFflxiQMKIFtKYI9kHBwS2mvaD+UkHQAmAfGr+nyKQeoHvFCAKMA2kx4l92+qmmBPuZDgX8X4M+5fMiWHLGFMi2jL57iXzPMPXhCAXfgjXf36EEjUOjgCtbXZ5tVUEdDhFqzfZ0l3dsCc69MxopBwNQRxrsU1oNjeq3rUHVyQj7kSiROkUf26zt9IgRHUEjL37XOzaUPpbO9NCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l9wRV6cd7Xrb5cmvtsvKHunlNvMadtWN7ey+6ySPYU=;
 b=d31zm+QJO1i8XznWEFvSOPDMb8W2bzwFBvReqiF06HjG76NOZyNKijGf8kjqenJqoIDxvgq2KYsrEEbUHKSmtqzR0yZ7b5N1mUCm2SVhvpWabC0n5KnWNvjFBp/AYWYYQzyIabpbd4LulZMmBmlAhdivrdAkGZsXzxIzaVuzSuNIeDkOXbm04CAvCw/YmOdxgRanCXP7Y+U/v6Xy2lJ5AlJlnExB6M9Horo2xHRV75I9HOfZ0kP9vALvhwAn0BHke3KKtPPrn+36MU6Si3Grbtd9p45gAzsFuQGQPeQOqnNrGrXdBvlw5HaHFs+Z7PZBgFtegLA9RBA9ubBBsF4DxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l9wRV6cd7Xrb5cmvtsvKHunlNvMadtWN7ey+6ySPYU=;
 b=HDVv2ekv7BCMNfp/VkHH2l8TZsAzn6jwN6UxUmkQCx2e+A/YD/fNeSerkfCeDvAotJOvDWCvJ4sHenFTphkxs0I28ScVOawXysMqkpcpCZBSS8tMS3+//eZ2qmKvPjvpfga3Ur8CyFcX+fnJN0OL3AwbZDev3H+Wq6wLwoC351O9VUaDTfqV5KUlLZPNA2FuA4gvpzxnBTLsRQ10JtjzKb6hAN9McW8V5skZBdUYAX1LgVG7ryXPHBapmx0uhKfcZYMX/OvpIURi0ZXJxqgSaup2q3sU192rC6Qiw0vTdnV3yK3mjSe4FT2k25QUTqAAQ3owlGnSsyhsBl2p9G3R4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1783.namprd12.prod.outlook.com (2603:10b6:903:121::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 18 Mar
 2022 13:47:51 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c%5]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 13:47:51 +0000
Date: Fri, 18 Mar 2022 10:47:50 -0300
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 3/8] iommu/vt-d: Implement device_pasid domain attach
 ops
Message-ID: <20220318134750.GK11336@nvidia.com>
References: <20220315050713.2000518-1-jacob.jun.pan@linux.intel.com>
 <20220315050713.2000518-4-jacob.jun.pan@linux.intel.com>
 <20220315143322.GW11336@nvidia.com>
 <20220315153620.710a30fa@jacob-builder>
 <20220315230457.GO11336@nvidia.com>
 <20220316135004.61ae1611@jacob-builder>
 <20220316221550.GS11336@nvidia.com>
 <17d73d88e08047f09636cf39edd69892@intel.com>
 <20220317000410.GU11336@nvidia.com>
 <BN9PR11MB5276FBE20A09F0D703FE5C948C139@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276FBE20A09F0D703FE5C948C139@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::33) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fbd5aea-47fe-41bd-b9ea-08da08e5e55e
X-MS-TrafficTypeDiagnostic: CY4PR12MB1783:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB17834481315A4B75712F622AC2139@CY4PR12MB1783.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G38hN9V2qPzUtJyb4i5u3er9aVSt3Y0jiryW8MnMly8M29G8mb5Touq9JK7oJZlaKQjWpjbsqLKrU0uog2ZhWpvZKPVGEaydU2eUIBnOLmNSUSZT0Ev6jPapyBkyn39MTDictky2NzrQeHnrqywZf7Wv3HlsjbeQBJoXhUG1m2vgUJ3xvWGbwiSUl96yxwnfVZ7BcJBf68D+X6J/BBUTdt+zGnvTW/iqSZNXKqwCgfGFJVt5SUtwXZGL42qILvjuCBfhLSCzAsOjcI5KXtF4NIAA3uwOFJl+Xk/2d+Mo198C+tOmK6JztuL60MTZzuCDvFb8MM2aOIjRkVxwiBqE9n4MbpLQAWM1uQ4I9sdavn/Zfo6DujeNnh3eWpA/CVm6P7m739lSzUwENH55/3+1RQzOWqCi9CxFks6i6Lek2S3w+pxqfbDxqM92wnYcnLSf1yngiC8NMHX207euiJVl4zydJOf1BOUvUjRO8t8o6ODtUEv01JKIV6eUBpIyoheuAaqmVkrfAXR8DDnIY+PA18kkaowSmcwnVClfobfWJ2JGsQR6wgza1JwghsHLfA49fBwWz7nKxH+yef5Exxl1nRslf2ZXxaab0Do+0lRFTHT9uDW/hXMDIjz3ORQaqy9DnLjE2pMaw1qwuhGdJGrrWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(316002)(54906003)(2616005)(1076003)(186003)(26005)(2906002)(38100700002)(4326008)(6506007)(66476007)(66556008)(6916009)(66946007)(5660300002)(8676002)(7416002)(86362001)(4744005)(508600001)(33656002)(8936002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MX9VWYSiPMaixDqUg4/QUMEdSgrfb2XztNdzQAAIXPlDdJcmYYaEZ+Wpf6G0?=
 =?us-ascii?Q?TMfffpDbrgJqRt953CxNu3wqE6nkK0i1LVLs2iE3XRc0Yt64HcKPZ6rrxNQU?=
 =?us-ascii?Q?DZeCylJbyx0OT266Y7khHV0WxJiHEfQJGDWBAoAID7AO8D3e5RKzY8KCBrII?=
 =?us-ascii?Q?1kOvUm7ulftGWSJRRcsDhBcPLuqWF4JQ03VdFabpM+0qvZcg/iJwGs6vVVr7?=
 =?us-ascii?Q?B5hIwpKR1DXCUpIrrRQyYnjhDbngw6B3ejnHP+OxQ8ivHEHK2O9qSLUtxSY8?=
 =?us-ascii?Q?iR+9FZMDYsbFIAe0QDfzqZyThKedQ2SwWPlZ+0PmqYWzHzcp7CA5T5C3G76h?=
 =?us-ascii?Q?JL9UpxK6VPkLWoZbFMKF7yzdHUCIqtOyPQqsSwR9MrmF69cka/ioz6CWGqCk?=
 =?us-ascii?Q?LxncmqLdsHlfTJdrR1rlKqUxQfCMO3QZCF7bSC6/NTJE7TQm2JqUUReTDYfU?=
 =?us-ascii?Q?pkw3maUH9gFkEGr2oW9eATpAnOYADqMxJGf0N1gWMch+YJMDSrzVGTGIHGSX?=
 =?us-ascii?Q?D4JwQfkOAqDjIgaiYXavADmRnG981j4VnHul+lr74ga1Tw0pHMS2jqL2wGpK?=
 =?us-ascii?Q?FvfaVoVI0VZPumjvqFXcdy2jzBTYlTXVVytUSck96/L6Web0WnIVrAYWagwz?=
 =?us-ascii?Q?eULb4JAfmUHaNyiw7lYqIzjcnULRAH+KvKCwyk5lVCaeQeEYQLOQktwUtgwa?=
 =?us-ascii?Q?cvhfyOAuu+cTFgI4AdvWAihZiT5KRXxF7JuGinRJ2680SF4tn6ZyiGSHUXYz?=
 =?us-ascii?Q?xbDVDxc5+N2YVf1svTDAguw4ufRbCUXYaDYJ9s+SK9+XDczLAEhOm83gO6PP?=
 =?us-ascii?Q?H7NMD0bPmtpi3cALipe8y7H/UMz0Zi0Jpdm8H3sSRi7xYyXkWRlbdeZMmbKr?=
 =?us-ascii?Q?Zwtmlz267IOXSK5+GandhNJOmTls1Exi2shqlZa80zpN51vIgKVA17w7Dt28?=
 =?us-ascii?Q?dWj2WGbohl8RxCS02Enw33N3ZcN4mfw6Vk17BmFNhMO6nidnckFQqu6K4ZG/?=
 =?us-ascii?Q?QqmXA7COzWtMG+g+/eNRPyUHX+XweTlh65akWxXVz+C4hInJSE2wHkXUoBTr?=
 =?us-ascii?Q?fTYKbjOPcQNtzyV2S5ebm4Y5ioWh0hJjKEq4/u5wRNc85jG4PnpzgoOfuU+x?=
 =?us-ascii?Q?Xs+LLH3brWQxd8Efq8KmCOgQc4VDcbdBzhzrS37McpXEJyfWmpB75rTrLqDL?=
 =?us-ascii?Q?tD4H/9gcfafJzcQKLznaut0F9xdZObYICEq+nTA8eyvAjdgtkKy3soSbNhc3?=
 =?us-ascii?Q?e8yUQasvTDIoE0OSn5kq+VYyVYyhaoXi/QlxBJ01Bmck2qCrzFp6Ruc5OhOo?=
 =?us-ascii?Q?hrN6J08HzmQog8Vpp0ERDijNQKTUSYcPboKKJwUFkauAf2V/nX/mNInw+J0m?=
 =?us-ascii?Q?zVHvtPJ7UQC+WOGZyNgz9QXdjNvfL1Tx7VQfDSoOv8acKDzwwbIV8f55cKt6?=
 =?us-ascii?Q?w5I0Zk+SE2P0suwuZAT0oQ3coy5745H/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbd5aea-47fe-41bd-b9ea-08da08e5e55e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 13:47:51.6319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbKMS7StgudzCoxVJdF+50+UvZwk7FUSKUokjaQ2jGzbv8rYPj7Y1DRTOhm5og8F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1783
Cc: "Jiang, Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "Zanussi, Tom" <tom.zanussi@intel.com>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Luck,
 Tony" <tony.luck@intel.com>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
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

On Fri, Mar 18, 2022 at 05:47:23AM +0000, Tian, Kevin wrote:
> may remember more detail here) and we didn't hear strong interest
> from customer on it. So this is just FYI for theoretical possibility and 
> I'm fine with even disallowing it before those issues are resolved.

I didn't mean disallow, I just ment lets not optimize for it.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
